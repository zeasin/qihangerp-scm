<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="退货单号" prop="afterSaleOrderId">
        <el-input
          v-model="queryParams.afterSaleOrderId"
          placeholder="请输入退货单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="源订单号" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入源订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商户" prop="merchantId">
        <el-select v-model="queryParams.merchantId" placeholder="请选择商户" clearable @change="handleQuery">
          <el-option
            v-for="item in merchantList"
            :key="item.id"
            :label="item.nickName"
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
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
      <!-- <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['api:returned:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['api:returned:remove']"
        >删除</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dataList" @selection-change="handleSelectionChange">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="退货单号" align="center" prop="afterSaleOrderId" />
      <el-table-column label="退货类型" align="center" prop="type" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.type === 10"> 退货</el-tag>
          <el-tag size="small" v-if="scope.row.type === 20"> 换货</el-tag>
          <el-tag size="small" v-if="scope.row.type === 80"> 补发</el-tag>
          <el-tag size="small" v-if="scope.row.type === 99"> 订单拦截</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="源订单号" align="center" prop="orderId" />
       <el-table-column label="店铺" align="center" prop="shopId" >
         <template slot-scope="scope">
           <span>{{ merchantList.find(x=>x.id === scope.row.merchantId).nickName  }}</span>
         </template>
       </el-table-column>
       <el-table-column label="订单id" align="center" prop="orderId" />
       <el-table-column label="子订单id" align="center" prop="subOrderId" />
       <el-table-column label="商品" align="center" prop="title" />
       <el-table-column label="sku" align="center" prop="skuInfo" />
       <el-table-column label="SKU编码" align="center" prop="skuCode" />
      <el-table-column label="数量" align="center" prop="count" />
       <el-table-column label="物流公司" align="center" prop="shipCompany" />
      <el-table-column label="物流单号" align="center" prop="shipWaybillCode" />
      <el-table-column label="收货人" align="center" prop="receiverName" />
      <el-table-column label="手机号" align="center" prop="receiverTel" />
      <el-table-column label="收货地址" align="center" prop="receiverAddress" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 1"> 已发出</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2"> 已完成</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
           v-if="scope.row.status === 1"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['api:returned:edit']"
          >确认完成</el-button>
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

    <!-- 添加或修改退换货对话框 -->

  </div>
</template>

<script>
import {list, addExchange, shipAgainComplete} from "@/api/afterSale/exchange";
import {listMerchant} from "@/api/channel/merchant";

export default {
  name: "ExchangeAfter",
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
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 表格数据
      dataList: [],
      merchantList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        afterSaleOrderId: null,
        shopId: null,
        orderId: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        shopId: [{ required: true, message: "请选择店铺", trigger: "change" }],
        afterSaleOrderId: [{ required: true, message: "不能为空", trigger: "blur" }],
        orderId: [{ required: true, message: "订单号不能为空", trigger: "blur" }],
        subOrderId: [{ required: true, message: "不能为空", trigger: "blur" }],
        erpGoodsId: [{ required: true, message: "不能为空", trigger: "blur" }],
        erpSkuId: [{ required: true, message: "不能为空", trigger: "change" }],
        skuInfo: [{ required: true, message: "不能为空", trigger: "change" }],
        title: [{ required: true, message: "不能为空", trigger: "change" }],
        count: [{ required: true, message: "不能为空", trigger: "change" }],
        shipCompany: [{ required: true, message: "不能为空", trigger: "change" }],
        shipWaybillCode: [{ required: true, message: "不能为空", trigger: "change" }],
        receiverName: [{ required: true, message: "不能为空", trigger: "change" }],
        receiverTel: [{ required: true, message: "不能为空", trigger: "change" }],
        receiverAddress: [{ required: true, message: "不能为空", trigger: "change" }],
      }
    };
  },
  created() {
    listMerchant({}).then(response => {
      this.merchantList = response.rows;
    });
    this.getList();
  },
  methods: {
    /** 查询退换货列表 */
    getList() {
      this.loading = true;
      list(this.queryParams).then(response => {
        this.dataList = response.rows;
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
    handleAdd(){
      this.reset()
      this.open=true
      this.title="手动添加换货"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      shipAgainComplete(id).then(response => {
        this.$modal.msgSuccess("确认完成");
        this.getList()
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          addExchange(this.form).then(response => {
            this.$modal.msgSuccess("补发成功");
            this.open = false;
            this.getList();
          });

        }
      });
    }
  }
};
</script>
