<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="商品名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入商品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品编号" prop="number">
        <el-input
          v-model="queryParams.number"
          placeholder="请输入商品编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="disable">
        <el-select v-model="queryParams.status" filterable  placeholder="状态">
          <el-option label="销售中" value="1"></el-option>
          <el-option label="已下架" value="2"></el-option>
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['goods:goods:add']"
        >添加商品</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          @click="handleImport"-->
<!--          v-hasPermi="['goods:goods:edit']"-->
<!--        >推送到线下渠道店铺</el-button>-->
<!--      </el-col>-->
      <!--
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['goods:goods:remove']"
        >删除</el-button>
      </el-col> -->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['goods:goods:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="商品名称" align="left" prop="name" width="300"/>
      <el-table-column label="商品图片" align="center" prop="image" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.image" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="商品编号" align="center" prop="goodsNum" />
      <!-- <el-table-column label="条码" align="center" prop="barCode" /> -->
<!--      <el-table-column label="预计采购价格" align="center" prop="purPrice" />-->
<!--      <el-table-column label="建议批发价" align="center" prop="wholePrice" />-->
<!--      <el-table-column label="建议零售价" align="center" prop="retailPrice" />-->
      <!-- <el-table-column label="单位成本" align="center" prop="unitCost" /> -->

      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 1">销售中</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2">已下架</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleViewSkuList(scope.row)"
          >查看SKU</el-button>
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


    <el-dialog :title="title" :visible.sync="skuOpen" width="1000px" append-to-body>
      <el-table v-loading="loading" :data="skuList">
        <!-- <el-table-column type="selection" width="55" align="center" /> -->
        <el-table-column label="Sku Id" align="center" prop="id" />
        <el-table-column label="商品名称" align="center" prop="goodsName" />
        <el-table-column label="SKU名称" align="center" prop="skuName" />
        <el-table-column label="SKU编码" align="center" prop="skuCode" />
        <el-table-column label="商品图片" align="center" prop="colorImage" width="100">
          <template slot-scope="scope">
            <image-preview :src="scope.row.colorImage" :width="50" :height="50"/>
          </template>
        </el-table-column>
        <el-table-column label="预计采购价" align="center" prop="purPrice" />
        <el-table-column label="状态" align="center" prop="status" >
          <template slot-scope="scope">
            <el-tag size="small" v-if="scope.row.status === 1">销售中</el-tag>
            <el-tag size="small" v-if="scope.row.status === 2">已下架</el-tag>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

  </div>
</template>

<script>
import { listGoods, getGoods, delGoods, updateGoods } from "@/api/vms/goods/goods";
import Treeselect from '@riophae/vue-treeselect'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'

import {getToken} from "@/utils/auth";

export default {
  name: "Goods",
  components: { Treeselect },
  data() {
    return {
      importOpen:false,
      headers: { 'Authorization': 'Bearer ' + getToken() },
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 商品管理表格数据
      goodsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      skuOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        image: null,
        number: null,
        unitName: null,
        categoryId: null,
        barCode: null,
        status: null,
        disable: null,
        supplierId: null,
        brandId: null,

      },
      // 表单参数
      form: {},
      categoryList: [],
      categoryTree: [],
      supplierList: [],
      skuList: [],
      // 表单校验
      rules: {

      }
    };
  },
  created() {
        this.getList();
  },
  methods: {
    normalizer(node) {
      return {
        id: node.id,
        label: node.value
      };
    },
    buildTree(list, parentId) {
      let tree = [];
      for (let i = 0; i < list.length; i++) {
        if (list[i].parentId === parentId) {
          let node = {
            id: list[i].id,
            label: list[i].name,
            children: this.buildTree(list, list[i].id)
          };
          tree.push(node);
        }
      }
      return tree;
    },
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      listGoods(this.queryParams).then(response => {
        this.goodsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    handleAdd(){
      this.$router.push('/goods/create');
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.skuOpen = false;
      this.skuList = []
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {};
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
    /** 查看SKU List*/
    handleViewSkuList(row){
      this.skuList = row.skuList
      this.skuOpen = true;

    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getGoods(id).then(response => {
        this.form = response.data;
        this.form.disable = response.data.disable+''
        this.open = true;
        this.title = "修改商品基本信息";
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除商品编号为"' + ids + '"的数据项？').then(function() {
        return delGoods(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateGoods(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('goods/goods/export', {
        ...this.queryParams
      }, `goods_${new Date().getTime()}.xlsx`)
    },
    handleImport(){
      this.importOpen = true
    }
  }
};
</script>
