<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="108px">
      <el-form-item label="平台SkuId" prop="skuId">
        <el-input
          v-model="queryParams.skuId"
          placeholder="请输入平台SkuId"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商家sku编码" prop="outerId">
        <el-input
          v-model="queryParams.outerId"
          placeholder="请输入商家sku编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="ERP skuId" prop="erpSkuId">
        <el-input
          v-model="queryParams.erpSkuId"
          placeholder="请输入ERP skuId"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="店铺" prop="shopId">
        <el-select v-model="queryParams.shopId" placeholder="请选择店铺" clearable @change="handleQuery">
         <el-option
            v-for="item in shopList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          :loading="pullLoading"
          type="success"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handlePull"
        >API拉取商品数据</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsList" @selection-change="handleSelectionChange">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
<!--      <el-table-column label="ID" align="center" prop="id" />-->
      <el-table-column label="电商平台SKUID" align="left" prop="skuId"  width="180px">
        <template slot-scope="scope">
          {{scope.row.skuId}} <br/>
          <el-tag>{{ shopList.find(x=>x.id === scope.row.shopId) ? shopList.find(x=>x.id === scope.row.shopId).name : '' }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="图片" align="center" prop="thumbImg" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.thumbImg" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="SKU编码" align="left" prop="skuCode" />
<!--      <el-table-column label="店铺商品ID" align="center" prop="productId" />-->
<!--      <el-table-column label="店铺Sku Id" align="center" prop="skuId" />-->
      <el-table-column label="商品标题" align="left" prop="title" />
      <el-table-column label="规格" align="center" prop="skuAttrs" >
        <template slot-scope="scope">
          {{ getSkuValues(scope.row.skuAttrs)}}
        </template>
      </el-table-column>

<!--      <el-table-column label="店铺" align="center" prop="categoryId" >-->
<!--        <template slot-scope="scope">-->
<!--          <el-tag size="small">{{categoryList.find(x=>x.id === scope.row.categoryId).name}}</el-tag>-->
<!--        </template>-->
<!--      </el-table-column>-->

      <el-table-column label="销售价" align="center" prop="salePrice" :formatter="amountFormatter">
        <template slot-scope="scope">{{amountFormatter(null,null,scope.row.salePrice / 100)}}</template>
      </el-table-column>
      <el-table-column label="商品库SKU ID" align="center" prop="ogoodsSkuId" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 5">销售中</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2">已下架</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleLink(scope.row)"
          >关联ERP</el-button>

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


    <!-- 添加或修改商品管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="SKU编码" prop="skuCode">
          <el-input v-model.number="form.skuCode" placeholder="请输入SKU编码" />
        </el-form-item>
        <el-form-item label="搜索Sku" prop="skuCode">
          <el-select v-model="form.skuCode" filterable remote reserve-keyword placeholder="搜索商品SKU" style="width: 330px;"
                     :remote-method="searchSku" :loading="skuListLoading" >
            <el-option v-for="item in skuList" :key="item.id"
                       :label="'【'+ item.skuCode+'】'+item.goodsName + ' ' + item.skuName "
                       :value="item.skuCode">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import { searchSku } from "@/api/goods/goods";
import {listShop} from "@/api/shop/shop";
import {pullGoodsList,listGoodsSku,getGoodsSku,linkErpGoodsSkuId} from "@/api/wei/goods";
import {MessageBox} from "element-ui";

export default {
  name: "GoodsWei",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      pullLoading: false,
      skuListLoading: false,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 商品管理表格数据
      goodsList: [],
      shopList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null
      },
      // 表单参数
      form: {
        id:null,
        skuCode:null
      },
      supplierList: [],
      categoryList: [],
      categoryTree: [],
      skuList: [],
      // 表单校验
      rules: {
        id: [
          { required: true, message: "不能为空", trigger: "change" }
        ],
        skuCode: [
          { required: true, message: "不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    listShop({type: 500}).then(response => {
      this.shopList = response.rows;
      if (this.shopList && this.shopList.length > 0) {
        this.queryParams.shopId = this.shopList[0].id
      }
      this.getList();
    });
    // this.getList();
    this.loading = false;
  },
  methods: {
    searchSku(query) {
      this.shopLoading = true;
      const qw = {
        keyword: query
      }
      searchSku(qw).then(res => {
        this.skuList = res.rows;
        this.skuListLoading = false;
      })
    },
    amountFormatter(row, column, cellValue, index) {
      return '￥' + parseFloat(cellValue).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    },
    getSkuValues(spec){
      try {
        // 解析 JSON，返回一个数组
        const parsedSpec = JSON.parse(spec) || [];

        // 使用 map 提取所有 value，使用 join() 用逗号连接
        return parsedSpec.map(item => item.attr_value).join(', ') || '';
      } catch (error) {
        return spec; // 如果 JSON 解析出错，返回空字符串
      }
    },
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      listGoodsSku(this.queryParams).then(response => {
        this.goodsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        skuCode: null
      };
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
    handleLink(row) {
      this.reset();
      const id = row.id || this.ids
      getGoodsSku(id).then(response => {
        this.form.id = response.data.id;
        this.form.skuCode = response.data.skuCode
        this.skuList = []
        if(this.form.skuCode){
          searchSku({keyword:this.form.skuCode}).then(res => {
            this.skuList = res.rows;
            this.open = true;
          })
        }else{
          this.open = true;
        }
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          linkErpGoodsSkuId(this.form).then(response => {
            this.$modal.msgSuccess("关联成功");
            this.open = false;
            this.getList();
          });
        }
      });
    },
    handlePull() {
      if(this.queryParams.shopId){
        this.pullLoading = true
        pullGoodsList({shopId:this.queryParams.shopId}).then(response => {
          console.log('拉取微信小店商品接口返回=====',response)
          if(response.code === 1401) {
            MessageBox.confirm('Token已过期，需要重新授权', '系统提示', { confirmButtonText: '重新授权', cancelButtonText: '取消', type: 'warning' }).then(() => {
              isRelogin.show = false;
              // store.dispatch('LogOut').then(() => {
              location.href = response.data.tokenRequestUrl+'?shopId='+this.queryParams.shopId
              // })
            }).catch(() => {
              isRelogin.show = false;
            });

            // return Promise.reject('无效的会话，或者会话已过期，请重新登录。')
          }else{
            this.$modal.msgSuccess(JSON.stringify(response));
            this.getList()
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
