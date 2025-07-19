<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="108px">
        <el-form-item label="出库单号" prop="outNum">
          <el-col :span="24">
            <el-input v-model="form.outNum" style="width:220px" placeholder="请输入出库单号" />
            <el-button type="" size="mini" @click="genOrderNum">生成单号</el-button>
          </el-col>

        </el-form-item>
        <el-form-item label="出库类型" prop="type">
          <el-select v-model="form.type" filterable r placeholder="出库类型" >
          <el-option  label="订单发货出库" value="1"></el-option>
          <el-option  label="采购退货出库" value="2"></el-option>
          <el-option  label="盘点出库" value="3"></el-option>
          <el-option  label="报损出库" value="4"></el-option>
        </el-select>
        </el-form-item>

        <el-form-item label="源单号" prop="sourceNo">
          <el-input v-model="form.sourceNo" style="width: 220px;" placeholder="请输入源单号" />
        </el-form-item>

        <el-form-item label="出库商品">
          <el-row :gutter="10" class="mb8" >
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddSShopOrderItem">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteSShopOrderItem">删除</el-button>
          </el-col>
        </el-row>
        </el-form-item>
        <!-- <el-divider content-position="center" style="margin-left: 98px;">商品信息</el-divider> -->

        <el-table style="margin-left: 108px;margin-bottom: 20px;" :data="form.itemList" :row-class-name="rowSShopOrderItemIndex" @selection-change="handleSShopOrderItemSelectionChange" ref="sShopOrderItem">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品" prop="batchId" width="350">
            <template slot-scope="scope">
              <!-- <el-input v-model="scope.row.goodsTitle" placeholder="请输入商品标题" /> -->
              <el-select v-model="scope.row.batchId" filterable remote reserve-keyword placeholder="搜索商品SKU" style="width: 330px;"
                         :remote-method="searchSkuInventoryBatch" :loading="skuListLoading" @change="skuChanage(scope.row)">
                <el-option v-for="item in skuList" :key="item.id"
                           :label="item.goodsName + ' ' + item.skuName +' - ' + item.skuCode"
                           :value="item.batchId">
                </el-option>
              </el-select>
<!--              <el-select v-model="scope.row.batchId" filterable remote reserve-keyword placeholder="搜索商品SKU库存" style="width: 330px;"-->
<!--                :remote-method="searchSkuInventoryBatch" :loading="skuListLoading" @change="skuChanage(scope.row)">-->
<!--                <el-option v-for="item in skuList" :key="item.batchId"-->
<!--                  :label="item.goodsName + ' ' + item.skuName +' - ' + item.skuCode"-->
<!--                  :value="item.batchId">-->
<!--                </el-option>-->
<!--              </el-select>-->
            </template>
          </el-table-column>
          <el-table-column label="商品图片" prop="goodsImg" width="150">
            <template slot-scope="scope">
              <!-- <el-input v-model="scope.row.goodsImg" placeholder="请输入商品图片" /> -->
              <el-image style="width: 70px; height: 70px" :src="scope.row.goodsImg"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="商品规格" prop="skuName" width="150">
          </el-table-column>
          <el-table-column label="Sku编码" prop="skuCode" width="150">
          </el-table-column>
          <el-table-column label="批次号" prop="batchNum" width="150">
          </el-table-column>
          <el-table-column label="仓库" prop="warehouseName" width="100" />
          <el-table-column label="仓位" prop="positionNum" width="100" />
          <el-table-column label="当前库存" prop="currentQty" width="100" />

          <el-table-column label="出库数量" prop="quantity" width="100">
            <template slot-scope="scope">
              <el-input v-model.number="scope.row.quantity" placeholder="请输入商品数量" />
            </template>
          </el-table-column>
        </el-table>

      <el-form-item label="操作人" prop="operator">
        <el-input v-model="form.operator" style="width: 220px;" placeholder="请输入操作人" />
      </el-form-item>

        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" style="width: 400px;" placeholder="备注" />
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer" style="margin-left: 108px;">
        <el-button type="primary" @click="submitForm">创建出库单</el-button>
        <!-- <el-button @click="cancel">取 消</el-button> -->
      </div>
  </div>
</template>

<script>
import { searchSkuInventoryBatch } from "@/api/vms/wms/goods_inventory";
import {stockOutCreate} from "@/api/vms/wms/stockOut";


export default {
  name: "StockInCreate",
  data() {
    return {
      // 表单参数
      form: {
        outNum:null,
        type:null,
        sourceNo:null,
        itemList:[],
        operator:null
      },
      // 表单校验
      rules: {
        outNum: [{ required: true, message: '单号不能为空' }],
        type: [{ required: true, message: '请选择入库类型' }],
        shopGroupId: [{ required: true, message: '不能为空' }],
        // operator: [{ required: true, message: '请填写操作人' }],
      },
      skuListLoading: false,
      skuList: [],
      shopList: [],
      shopGroupList: [],
      // 子表选中数据
      checkedSShopOrderItem: []
    };
  },
  created() {

  },
  methods: {
    genOrderNum(){
      const timestamp = Date.now();
      // 可以使用随机数增加订单号的唯一性
      const randomNumber = Math.floor(Math.random() * 1000);
      const orderNum = `${timestamp}${randomNumber}`;
      this.form.outNum = orderNum;
      console.log("======生成单号=======",orderNum)
    },
    // getDate() {
    //   var now = new Date();
    //   var year = now.getFullYear(); //得到年份
    //   var month = now.getMonth(); //得到月份
    //   var date = now.getDate(); //得到日期
    //   var hour = " 00:00:00"; //默认时分秒 如果传给后台的格式为年月日时分秒，就需要加这个，如若不需要，此行可忽略
    //   month = month + 1;
    //   month = month.toString().padStart(2, "0");
    //   date = date.toString().padStart(2, "0");
    //   var defaultDate = `${year}-${month}-${date}`;//
    //   return defaultDate;
    // },
    // 搜索SKU
    // searchSku(query) {
    //   this.shopLoading = true;
    //   const qw = {
    //     keyword: query
    //   }
    //   searchSku(qw).then(res => {
    //     this.skuList = res.rows;
    //     this.skuListLoading = false;
    //   })
    // },
    skuChanage(row) {
      console.log('=====0000====',row)
      const spec = this.skuList.find(x => x.batchId === row.batchId);
      if (spec) {
        console.log('=======11111==', spec)
        row.quantity = spec.currentQty
        row.batchId = spec.batchId
        row.skuId = spec.skuId
        row.goodsId = spec.goodsId
        row.goodsName = spec.goodsName
        row.skuName = spec.skuName
        row.goodsImg = spec.colorImage
        row.skuCode = spec.skuCode
        row.batchNum = spec.batchNum
        row.warehouseName = spec.warehouseName
        row.positionId = spec.positionId
        row.positionNum = spec.positionNum
        row.currentQty = spec.currentQty
      }
    },
    // 搜索SKU
    searchSkuInventoryBatch(query) {
      this.shopLoading = true;
      const qw = {
        keyword: query
      }
      searchSkuInventoryBatch(qw).then(res => {
        this.skuList = res.rows;
        console.log('=====skulist======',this.skuList)
        this.skuListLoading = false;
      })
    },
    // skuChanage(row) {
    //   console.log('==============aaaaaa======'.row)
    //   const spec = this.skuList.find(x => x.id === row.batchId);
    //   console.log('==============2222======'.spec)
    //   if (spec) {
    //     row.currentQty = spec.currentQty
    //     row.quantity = spec.currentQty
    //     row.batchId= spec.batchId
    //     row.skuId = spec.skuId
    //     row.goodsName = spec.goodsName
    //     row.goodsNum = spec.goodsNum
    //     row.skuName = spec.skuName
    //     row.goodsImg = spec.colorImage
    //     row.skuCode = spec.skuCode
    //     row.batchNum = spec.batchNum
    //     row.positionId = spec.positionId
    //     row.warehouseName = spec.warehouseName
    //     row.positionNum = spec.positionNum
    //     row.goodsId = spec.goodsId
    //     row.purPrice = spec.purPrice
    //
    //   }
    // },
    /** ${subTable.functionName}添加按钮操作 */
    handleAddSShopOrderItem() {
      let obj = {};
      obj.batchId=null;
      obj.positionId=0;
      obj.skuId =0;
      obj.goodsId = 0;
      obj.skuCode = "";
      obj.goodsName = "";
      obj.goodsNum = "";
      obj.goodsImg = "";
      obj.skuName = "";
      obj.quantity = 0;
      obj.warehouseName = null;
      this.form.itemList.push(obj);
    },
    /** ${subTable.functionName}删除按钮操作 */
    handleDeleteSShopOrderItem() {
      if (this.checkedSShopOrderItem.length == 0) {
        this.$modal.msgError("请先选择要删除的商品数据");
      } else {
        const sShopOrderItemList = this.form.itemList;
        const checkedSShopOrderItem = this.checkedSShopOrderItem;
        this.form.itemList = sShopOrderItemList.filter(function(item) {
          return checkedSShopOrderItem.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleSShopOrderItemSelectionChange(selection) {
      this.checkedSShopOrderItem = selection.map(item => item.index)
    },
    /** ${subTable.functionName}序号 */
    rowSShopOrderItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if(this.form.itemList && this.form.itemList.length >0){
            for(var i=0;i<this.form.itemList.length;i++){
              if(!this.form.itemList[i].batchId || !this.form.itemList[i].quantity){
                this.$modal.msgError("请完善商品信息");
                return
              }else if(this.form.itemList[i].quantity > this.form.itemList[i].currentQty){
                this.$modal.msgError("出库数量不能大于当前库存");
                return
              }
            }
            // this.form.itemList.forEach(x=>{
            //   if(!x.goodsId || !x.quantity){
            //     this.$modal.msgError("请完善商品信息");
            //     return
            //   }
            // })

            console.log('======创建出库单=====',this.form)
            stockOutCreate(this.form).then(response => {
              this.$modal.msgSuccess("创建成功");
              // 调用全局挂载的方法,关闭当前标签页
              this.$store.dispatch("tagsView/delView", this.$route);
              this.$router.push('/stock/stock_out');
            });

        }else{
          this.$modal.msgError("请添加商品");
        }

        }
      });
    }
  }
};

</script>
