<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单编号" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入订单编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="商户" prop="merchantId">
        <el-select v-model="queryParams.merchantId" placeholder="请选择" clearable @change="handleQuery">
         <el-option
            v-for="item in merchantList"
            :key="item.id"
            :label="item.nickName"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="供应商" prop="vendorId">
        <el-select v-model="queryParams.vendorId" placeholder="请选择" clearable @change="handleQuery">
          <el-option
            v-for="item in vendorList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
    <!--
      <el-form-item label="标签" prop="tag">
        <el-input
          v-model="queryParams.tag"
          placeholder="请输入标签"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      -->
<!--      <el-form-item label="收件人" prop="receiverName">-->
<!--        <el-input-->
<!--          v-model="queryParams.receiverName"-->
<!--          placeholder="请输入收件人"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="手机号" prop="receiverPhone">-->
<!--        <el-input-->
<!--          v-model="queryParams.receiverPhone"-->
<!--          placeholder="请输入手机号"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->

     <!--  <el-form-item label="城市" prop="city">
        <el-input
          v-model="queryParams.city"
          placeholder="请输入城市"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="省份" prop="province">
        <el-input
          v-model="queryParams.province"
          placeholder="请输入省份"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->

<!--      <el-form-item label="快递单号" prop="shippingNumber">-->
<!--        <el-input-->
<!--          v-model="queryParams.shippingNumber"-->
<!--          placeholder="请输入快递单号"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>



    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="订单ID" align="center" prop="id" />
      <el-table-column label="订单编号" align="center" prop="orderNum" />
      <el-table-column label="商户" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span>{{ merchantList.find(x=>x.id === scope.row.merchantList).name  }}</span>
        </template>
      </el-table-column>

      <el-table-column label="商品" width="350">
          <template slot-scope="scope">
            <el-row v-for="item in scope.row.itemList" :key="item.id" :gutter="20">

            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="item.goodsImg"></el-image>
              <div style="margin-left:10px">
              <p>{{item.goodsTitle}}</p>
              <p>{{item.goodsSpec}}&nbsp;
                <el-tag size="small">x {{item.quantity}}</el-tag>
                </p>
              </div>
            </div>
            </el-row>
          </template>
      </el-table-column>
      <el-table-column label="订单备注" align="center" prop="remark" >
        <template slot-scope="scope">
          {{scope.row.remark}}<br />
          {{scope.row.tag}}
        </template>
      </el-table-column>
      <!-- <el-table-column label="买家留言信息" align="center" prop="buyerMemo" /> -->
      <!-- <el-table-column label="标签" align="center" prop="tag" /> -->
      <el-table-column label="状态" align="center" prop="orderStatus" >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.orderStatus === 1" style="margin-bottom: 6px;">待发货</el-tag>
          <el-tag v-if="scope.row.orderStatus === 2" style="margin-bottom: 6px;">已出库</el-tag>
          <el-tag v-if="scope.row.orderStatus === 3" style="margin-bottom: 6px;">已发货</el-tag>
          <el-tag v-if="scope.row.orderStatus === 4" style="margin-bottom: 6px;">已完成</el-tag>
          <br />
           <!-- 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 -->
           <el-tag v-if="scope.row.refundStatus === 1">无售后或售后关闭</el-tag>
           <el-tag v-if="scope.row.refundStatus === 2">售后处理中</el-tag>
           <el-tag v-if="scope.row.refundStatus === 3">退款中</el-tag>
           <el-tag v-if="scope.row.refundStatus === 4">退款成功</el-tag>
        </template>
      </el-table-column>
      <!-- <el-table-column label="售后状态" align="center" prop="refundStatus" /> -->
      <!-- <el-table-column label="订单状态" align="center" prop="orderStatus" /> -->
      <!-- <el-table-column label="邮费，单位：元" align="center" prop="postage" /> -->
      <!-- <el-table-column label="折扣金额(元)" align="center" prop="discountAmount" /> -->
      <!-- <el-table-column label="商品金额(元)" align="center" prop="goodsAmount" /> -->
      <el-table-column label="支付金额" align="center" prop="amount" />
      <!-- <el-table-column label="支付时间" align="center" prop="payTime" /> -->
      <el-table-column label="收件信息" align="left" prop="receiverName" >
        <template slot-scope="scope">
          {{scope.row.receiverName}}<br />
          {{scope.row.province}} {{scope.row.city}} {{scope.row.town}}
        </template>
      </el-table-column>
      <!-- <el-table-column label="手机号" align="center" prop="receiverPhone" /> -->
      <!-- <el-table-column label="${comment}" align="center" prop="address" /> -->
      <!-- <el-table-column label="${comment}" align="center" prop="town" /> -->
      <!-- <el-table-column label="省" align="center" prop="province" /> -->
      <!-- <el-table-column label="市" align="center" prop="city" /> -->
      <el-table-column label="发货时间" align="center" prop="shippingTime" />
      <el-table-column label="快递单号" align="center" prop="shippingNumber" />
      <!-- <el-table-column label="物流公司" align="center" prop="shippingCompany" /> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['shop:order:edit']"
          >详情</el-button>

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

    <!-- 订单详情对话框 -->
    <el-dialog :title="detailTitle" :visible.sync="detailOpen" width="1100px" append-to-body>

      <el-form ref="form" :model="form" :rules="rules" label-width="80px" inline>
        <el-descriptions title="订单信息">
            <el-descriptions-item label="ID">{{form.id}}</el-descriptions-item>
            <el-descriptions-item label="订单号">{{form.orderNum}}</el-descriptions-item>
            <el-descriptions-item label="商户">
              {{ merchantList.find(x=>x.id === form.merchantId)?merchantList.find(x=>x.id === form.merchantId).name:'' }}
            </el-descriptions-item>


            <el-descriptions-item label="标签">
              <el-tag size="small" v-if="form.tag ==='1' ">实售</el-tag>
              <el-tag size="small" v-if="form.tag ==='2' ">淘宝客</el-tag>
              <el-tag size="small" v-if="form.tag ==='3' ">刷单</el-tag>
              <el-tag size="small" v-if="form.tag ==='4' ">返现</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="买家留言">
              {{form.buyerMemo}}
            </el-descriptions-item>
            <el-descriptions-item label="备注">
              {{form.remark}}
            </el-descriptions-item>
            <el-descriptions-item label="创建时间">
              {{ form.createTime }}
              <!-- <el-date-picker
              disabled
                v-model="form.orderCreateTime"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm:ss"
                placeholder="请选择订单创建时间">
              </el-date-picker> -->
            </el-descriptions-item>
             <el-descriptions-item label="支付时间"> {{ form.payTime }}</el-descriptions-item>
             <el-descriptions-item label="最后更新时间"> {{ form.updateTime }}</el-descriptions-item>

            <el-descriptions-item label="订单状态">
              <el-tag v-if="form.orderStatus === 1" style="margin-bottom: 6px;">待发货</el-tag>
              <el-tag v-if="form.orderStatus === 2" style="margin-bottom: 6px;">已发货</el-tag>
              <el-tag v-if="form.orderStatus === 3" style="margin-bottom: 6px;">已签收</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="退款状态">
              <el-tag v-if="form.refundStatus === 1">无售后或售后关闭</el-tag>
              <el-tag v-if="form.refundStatus === 2">售后处理中</el-tag>
               <el-tag v-if="form.refundStatus === 3">退款中</el-tag>
               <el-tag v-if="form.refundStatus === 4">退款成功</el-tag>
            </el-descriptions-item>

        </el-descriptions>
        <el-descriptions title="付款信息">
            <el-descriptions-item label="商品总额">{{form.goodsAmount}}</el-descriptions-item>
            <el-descriptions-item label="优惠金额">{{form.discountAmount}}</el-descriptions-item>
            <el-descriptions-item label="运费">{{form.postage}}</el-descriptions-item>
            <el-descriptions-item label="实际支付金额">{{form.amount}}</el-descriptions-item>
        </el-descriptions>


         <el-descriptions title="收货信息">
          <el-descriptions-item label="收件人姓名">{{form.receiverName}}</el-descriptions-item>
          <el-descriptions-item label="收件人手机号">{{form.receiverPhone}}</el-descriptions-item>
          <el-descriptions-item label="省市区">{{form.province}}{{form.city}}{{form.town}}</el-descriptions-item>
          <el-descriptions-item label="详细地址">{{form.address}}</el-descriptions-item>
        </el-descriptions>
        <el-descriptions title="发货信息">
          <el-descriptions-item label="发货方式">
            <el-tag v-if="form.shipType === 1"  type="danger">供应商代发</el-tag>
              <el-tag v-if="form.shipType === 0" type="danger">仓库发货</el-tag>
          </el-descriptions-item>
            <el-descriptions-item label="物流公司">{{form.shippingCompany}}</el-descriptions-item>
            <el-descriptions-item label="物流单号">{{form.shippingNumber}}</el-descriptions-item>
            <el-descriptions-item label="发货时间">{{form.shippingTime}}</el-descriptions-item>
        </el-descriptions>

        <el-divider content-position="center">订单商品</el-divider>
        <el-table :data="form.itemList"  style="margin-bottom: 10px;">
          <!-- <el-table-column type="selection" width="50" align="center" /> -->
          <el-table-column label="序号" align="center" type="index" width="50"/>

          <el-table-column label="商品图片" prop="goodsImg" width="80">
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.goodsImg"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="商品标题" prop="goodsTitle" ></el-table-column>
          <el-table-column label="SKU" prop="goodsSpec" width="150"></el-table-column>
          <el-table-column label="sku编码" prop="specNum"></el-table-column>
          <el-table-column label="单价" prop="goodsPrice"></el-table-column>
          <el-table-column label="数量" prop="quantity"></el-table-column>
          <!-- <el-table-column label="商品金额" prop="itemAmount"></el-table-column> -->
        </el-table>
      </el-form>
      <!-- <div slot="footer" class="dialog-footer" v-if="isAudit">
        <el-button type="primary" @click="submitConfirmForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div> -->
    </el-dialog>
  </div>
</template>

<script>
import { listOrder, getOrder} from "@/api/ship/order";
import { listMerchant } from "@/api/channel/merchant";
export default {
  name: "Order",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedSShopOrderItem: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 店铺订单表格数据
      orderList: [],
      // ${subTable.functionName}表格数据
      sShopOrderItemList: [],
      shopList:[],
      merchantList:[],
      vendorList:[],
      // 弹出层标题
      detailTitle:'订单详情',
      detailOpen:false,
      isAudit:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderNum: null,
        shopId: null,
        vendorId: null,
        merchantId: null,
        refundStatus: null,
        orderStatus: null,
        payTime: null,
        receiverName: null,
        receiverPhone: null,
        town: null,
        city: null,
        province: null,
        shippingTime: null,
        shippingNumber: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {

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
    /** 查询店铺订单列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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

    /** 导出按钮操作 */
    handleExport() {
      this.download('api/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    },
    reset(){

    },
    /** 删除按钮操作 */
    handleDetail(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;
        // this.$nextTick(()=>{
        //   this.form.shipType = response.data.shipType
        // })
        this.detailOpen = true;
        this.detailTitle = "订单详情";
      });
      this.isAudit = false
    },
  }
};
</script>
