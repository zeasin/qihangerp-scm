<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="平台" prop="shopType">-->
<!--        <el-input-->
<!--          v-model="queryParams.shopType"-->
<!--          placeholder="请输入平台"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="店铺" prop="shopId">
<!--        <el-input-->
<!--          v-model="queryParams.shopId"-->
<!--          placeholder="请输入店铺"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
        <el-select v-model="queryParams.shopId" placeholder="请选择店铺" clearable @change="handleQuery">
          <el-option
            v-for="item in shopList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="商品编码" prop="goodsNum">
        <el-input
          v-model="queryParams.goodsNum"
          placeholder="请输入商品编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入商品标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >手动添加店铺商品</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          :loading="pullLoading"
          type="success"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handlePull(1)"
        >API拉取店铺商品</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsList" @selection-change="handleSelectionChange">
      <el-table-column label="序号" type="index" />
      <el-table-column label="网店商品ID" align="center" prop="platformGoodsId" />
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <el-tag size="small">{{ shopList.find(x=>x.id === scope.row.shopId)?shopList.find(x=>x.id === scope.row.shopId).name :'' }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="商品编码" align="center" prop="goodsNum" />
      <el-table-column label="商品标题" align="center" prop="title" />
      <el-table-column label="主图" align="center" prop="goodsImg" >
        <template slot-scope="scope">
          <el-image style="width: 70px; height: 70px" :src="scope.row.goodsImg"></el-image>
        </template>
      </el-table-column>
      <el-table-column label="累计销量" align="center" prop="totalSales" />

      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status===1">上架中</el-tag>
          <el-tag size="small" v-if="scope.row.status===2">已下架</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleSkuDetail(scope.row)"
          >SKU列表</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
    <el-dialog title="SKU列表" :visible.sync="skuOpen" width="960px" append-to-body>
      <el-table v-loading="loading" :data="goodsSkuList" @selection-change="handleSelectionChange">
        <el-table-column label="序号" type="index" />
        <el-table-column label="网店商品ID" align="center" prop="platformGoodsId" />
        <el-table-column label="网店SKUID" align="center" prop="skuId" />
        <el-table-column label="供应链SKUID" align="center" prop="erpGoodsSpecId" />
        <el-table-column label="SKU编码" align="center" prop="skuCode" />
        <el-table-column label="SKU名称" align="center" prop="goodsSpec" />
        <el-table-column label="状态" align="center" prop="status" >
          <template slot-scope="scope">
            <el-tag size="small" v-if="scope.row.status===1">上架中</el-tag>
            <el-tag size="small" v-if="scope.row.status===2">已下架</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-link"
            >关联供应链SKUID</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
    <!-- 添加或修改店铺商品对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="960px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="店铺" prop="shopId">
        <el-select v-model="form.shopId" placeholder="请选择店铺" clearable >
          <el-option
            v-for="item in shopList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
        </el-form-item>
        <el-row>
          <el-col :span="12">
            <el-form-item label="平台商品ID" prop="platformGoodsId">
              <el-input type="number" v-model="form.platformGoodsId" placeholder="请输入平台商品ID" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="供应链商品ID" prop="erpGoodsId">
              <el-input type="number" v-model="form.erpGoodsId" placeholder="请输入供应链商品ID" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
        <el-form-item label="商品编码" prop="goodsNum">
          <el-input v-model="form.goodsNum" placeholder="请输入商品编码" />
        </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="参考价格" prop="price">
              <el-input type="number" v-model="form.price" placeholder="请输入参考价格" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="商品标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入商品标题" />
        </el-form-item>

        <el-form-item label="商品主图URL" prop="goodsImg">
          <el-input v-model="form.goodsImg" placeholder="请输入商品主图URL" />
        </el-form-item>
        <el-row>
          <el-col :span="12">
        <el-form-item label="累计销量" prop="totalSales">
          <el-input type="number" v-model.number="form.totalSales" placeholder="请输入累计销量" />
        </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-select v-model="form.status" placeholder="状态" clearable>
                <el-option label="上架中" value="1"></el-option>
                <el-option label="已下架" value="2"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
        </el-form-item>

        <el-divider content-position="center">商品SKU列表</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddSShopGoodsSku">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteSShopGoodsSku">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="skuList" :row-class-name="rowSShopGoodsSkuIndex" @selection-change="handleSShopGoodsSkuSelectionChange" ref="sShopGoodsSku">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>

          <el-table-column label="平台商品skuid" prop="skuId" width="150">
            <template slot-scope="scope">
              <el-input type="number" v-model="scope.row.skuId" placeholder="请输入平台商品skuid" />
            </template>
          </el-table-column>
          <el-table-column label="供应链商品skuid" prop="spec" width="150">
            <template slot-scope="scope">
              <el-input type="number" v-model="scope.row.erpGoodsSpecId" placeholder="请输入供应链商品skuid" />
            </template>
          </el-table-column>
          <el-table-column label="SKU编码" prop="skuCode" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.skuCode" placeholder="请输入SKU编码" />
            </template>
          </el-table-column>
          <el-table-column label="SKU名称" prop="goodsSpec" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsSpec" placeholder="请输入SKU名称" />
            </template>
          </el-table-column>
<!--          <el-table-column label="数量" prop="skuQuantity" width="150">-->
<!--            <template slot-scope="scope">-->
<!--              <el-input v-model="scope.row.skuQuantity" placeholder="请输入数量" />-->
<!--            </template>-->
<!--          </el-table-column>-->
          <el-table-column label="状态" prop="status" width="150">
            <template slot-scope="scope">
<!--              <el-input type="number" v-model="scope.row.status" placeholder="状态1上架2下架" />-->
              <el-select v-model="scope.row.status" placeholder="状态" clearable>
                <el-option label="上架中" value="1"></el-option>
                <el-option label="已下架" value="2"></el-option>
              </el-select>
            </template>
          </el-table-column>

        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listGoods, delGoods, addGoods } from "@/api/shop/goods";
import {listShop} from "@/api/shop/shop";

export default {
  name: "Goods",
  data() {
    return {
      // 遮罩层
      loading: true,
      pullLoading: false,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedSShopGoodsSku: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 店铺商品表格数据
      goodsList: [],
      goodsSkuList: [],
      // ${subTable.functionName}表格数据
      skuList: [],
      shopList:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      skuOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        platformGoodsId: null,
        erpGoodsId: null,
        shopId: null,
        shopType: null,
        goodsNum: null,
        title: null,
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        shopId: [{ required: true, message: "请选择店铺", trigger: "change" }],
        platformGoodsId: [{ required: true, message: "平台商品id不能为空", trigger: "blur" }],
        shopType: [{ required: true, message: "不能为空", trigger: "change" }],
        erpGoodsId: [{ required: true, message: "不能为空", trigger: "change" }],
        goodsNum: [{ required: true, message: "不能为空", trigger: "change" }],
        title: [{ required: true, message: "不能为空", trigger: "change" }],
        status: [{ required: true, message: "不能为空", trigger: "change" }],
      }
    };
  },
  created() {
    listShop({}).then(response => {
      this.shopList = response.rows;
    });
    this.getList();
  },
  methods: {
    /** 查询店铺商品列表 */
    getList() {
      this.loading = true;
      listGoods(this.queryParams).then(response => {
        this.goodsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.skuOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        platformGoodsId: null,
        erpGoodsId: null,
        shopId: null,
        shopType: null,
        goodsNum: null,
        price: null,
        title: null,
        remark: null,
        goodsImg: null,
        status: null,
        totalSales: 0
      };
      this.skuList = [];
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加店铺商品";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getGoods(id).then(response => {
        this.form = response.data;
        this.skuList = response.data.skuList;
        this.open = true;
        this.title = "修改店铺商品";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.skuList = this.skuList;
          if(!this.form.skuList || this.form.skuList.length===0){
            this.$modal.msgError("请添加SKU")
            return
          }
          if (this.form.id != null) {
            updateGoods(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGoods(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除店铺商品编号为"' + ids + '"的数据项？').then(function() {
        return delGoods(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
	/** ${subTable.functionName}序号 */
    rowSShopGoodsSkuIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** ${subTable.functionName}添加按钮操作 */
    handleAddSShopGoodsSku() {
      let obj = {};
      obj.goodsId = "";
      obj.skuId = "";
      obj.spec = "";
      obj.erpGoodsSpecId = "";
      obj.erpGoodsId = "";
      obj.erpGoodsSpecCode = "";
      obj.skuQuantity = "";
      obj.consignPrice = "";
      obj.outerId = "";
      obj.outerGoodsId = "";
      obj.price = "";
      obj.retailPrice = "";
      obj.amountOnSale = "";
      obj.isSkuOnsale = "";
      obj.cargoNumber = "";
      obj.attributes = "";
      this.skuList.push(obj);
    },
    /** ${subTable.functionName}删除按钮操作 */
    handleDeleteSShopGoodsSku() {
      if (this.checkedSShopGoodsSku.length == 0) {
        this.$modal.msgError("请先选择要删除的sku数据");
      } else {
        const sShopGoodsSkuList = this.skuList;
        const checkedSShopGoodsSku = this.checkedSShopGoodsSku;
        this.sShopGoodsSkuList = skuList.filter(function(item) {
          return checkedSShopGoodsSku.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleSShopGoodsSkuSelectionChange(selection) {
      this.checkedSShopGoodsSku = selection.map(item => item.index)
    },
    handleSkuDetail(row){
      this.goodsSkuList = row.skuList
      this.skuOpen = true;
    },
    handlePull(pull_type) {
      if(this.queryParams.shopId){
        this.pullLoading = true
        pullGoodsList({shopId:this.queryParams.shopId,pullType:pull_type}).then(response => {
          console.log('拉取JD商品接口返回=====',response)
          if(response.code === 1401) {
            MessageBox.confirm('Token已过期，需要重新授权！请前往店铺列表重新获取授权！', '系统提示', { confirmButtonText: '前往授权', cancelButtonText: '取消', type: 'warning' }).then(() => {
              this.$router.push({path:"/shop/shop_list",query:{type:3}})
              // isRelogin.show = false;
              // store.dispatch('LogOut').then(() => {
              // location.href = response.data.tokenRequestUrl+'?shopId='+this.queryParams.shopId
              // })
            }).catch(() => {
              isRelogin.show = false;
            });

            // return Promise.reject('无效的会话，或者会话已过期，请重新登录。')
          }else{
            this.getList()
            this.$modal.msgSuccess(JSON.stringify(response));
          }
          this.pullLoading = false

        })
      }else{
        this.$modal.msgSuccess("请先选择店铺");
      }

      // this.$modal.msgSuccess("请先配置API");
    },
  }
};
</script>
