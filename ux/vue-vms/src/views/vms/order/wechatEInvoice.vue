<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" label-width="100px">
      <el-form-item label="订单号">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="getList"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="getList">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="订单号" align="center" prop="orderNum" />
      <el-table-column label="商品明细" align="center">
        <template slot-scope="scope">
          <div v-for="item in scope.row.itemList" :key="item.id">
            {{ item.goodsName }} x {{ item.quantity }}
          </div>
        </template>
      </el-table-column>
      <el-table-column label="收件人" align="center" prop="receiverName" />
      <el-table-column label="地址" align="center">
        <template slot-scope="scope">
          {{ scope.row.province }} {{ scope.row.city }} {{ scope.row.town }} {{ scope.row.address }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button size="mini" type="primary" @click="handlePrint(scope.row)">打印</el-button>
          <el-button size="mini" type="success" @click="handleShip(scope.row)">发货</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import { listWechatOrders, printInvoice, shipOrder } from "@/api/vms/order";

export default {
  name: "WechatEInvoice",
  data() {
    return {
      loading: false,
      orderList: [],
      total: 0,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderNum: null
      },
      selectedOrders: []
    };
  },
  methods: {
    getList() {
      this.loading = true;
      listWechatOrders(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    resetQuery() {
      this.queryParams = {
        pageNum: 1,
        pageSize: 10,
        orderNum: null
      };
      this.getList();
    },
    handleSelectionChange(selection) {
      this.selectedOrders = selection;
    },
    handlePrint(order) {
      printInvoice(order.id).then(() => {
        this.$message.success("电子面单打印成功！");
      });
    },
    handleShip(order) {
      shipOrder(order.id).then(() => {
        this.$message.success("发货成功！");
        this.getList();
      });
    }
  },
  created() {
    this.getList();
  }
};
</script>
