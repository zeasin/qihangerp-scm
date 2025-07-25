<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单号" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入订单号"
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
           <span style="float: left">{{ item.name }}</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 500">微信小店</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 200">京东POP</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 280">京东自营</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 100">淘宝天猫</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 300">拼多多</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 400">抖店</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 999">线下渠道</span>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="下单时间" prop="orderTime">
        <el-date-picker clearable
                        v-model="orderTime" value-format="yyyy-MM-dd"
                        type="daterange"
                        range-separator="至"
                        start-placeholder="开始日期"
                        end-placeholder="结束日期">
        </el-date-picker>
      </el-form-item>
<!--      <el-form-item label="状态" prop="orderStatus">-->
<!--        <el-select v-model="queryParams.orderStatus" placeholder="请选择状态" clearable @change="handleQuery">-->
<!--          <el-option label="待发货" value="1" ></el-option>-->
<!--          <el-option label="已发货" value="2"> </el-option>-->
<!--          <el-option label="已完成" value="3"></el-option>-->
<!--        </el-select>-->
<!--      </el-form-item>-->



      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handlePull"
        >店铺订单导入发货</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >手动创建发货订单</el-button>
      </el-col>

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
<!--      <el-table-column label="订单ID" align="center" prop="id" />-->
      <el-table-column label="订单号" align="left" prop="tid" width="220px">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
          > {{scope.row.orderId}}</el-button>
          <i class="el-icon-copy-document tag-copy" :data-clipboard-text="scope.row.orderId" @click="copyActiveCode($event,scope.row.orderId)" ></i>
          <!--          <el-button type="text" :data-clipboard-text="scope.row.orderSn" size="mini" style="float: left"  @click="copyActiveCode($event,scope.row.orderSn)"  class="tag-copy">复制</el-button>-->
          <br/>
          <el-tag type="info">{{ shopList.find(x=>x.id === scope.row.shopId) ? shopList.find(x=>x.id === scope.row.shopId).name : '' }}</el-tag>
        </template>
      </el-table-column>
<!--      <el-table-column label="店铺" align="center" prop="shopId" >-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ shopList.find(x=>x.id === scope.row.shopId)?shopList.find(x=>x.id === scope.row.shopId).name :'' }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->

      <el-table-column label="商品" width="350">
          <template slot-scope="scope">
            <el-row v-for="item in scope.row.items" :key="item.id" :gutter="20">

            <div style="float: left;display: flex;align-items: center;" >
             <span>
              <image-preview :src="item.img" :width="50" :height="50"/>
                </span>
              <div style="margin-left:10px">
                <div>{{item.title}} </div>
                <div><el-tag type="info" size="small">{{item.skuName}}</el-tag>
                平台ID: {{item.skuId}}
                </div>
                <div>
                <el-tag size="small" v-if="item.skuCode">{{item.skuCode}}</el-tag>
                <el-tag size="small">x {{item.quantity}}</el-tag>
                  <span v-if="scope.row.refundStatus === 1">
                  <el-button type="text" size="mini" round @click="handleRefund(scope.row,item)">售后</el-button>
                </span>
                </div>

              </div>
            </div>
            </el-row>
          </template>
      </el-table-column>
      <el-table-column label="收件人信息" align="left" prop="userName" >
        <template slot-scope="scope">
          <span>{{scope.row.receiverNameMask}}</span><br />
          <span> {{scope.row.province}} {{scope.row.city}} {{scope.row.county}}
            </span>
          <p>
            {{scope.row.detailInfo}}
          </p>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" >
        <template slot-scope="scope">
          <span v-if="scope.row.buyerMemo">{{scope.row.buyerMemo}}</span>
          <span v-if="scope.row.sellerMemo">{{scope.row.sellerMemo}}</span>
          <span v-if="scope.row.remark">{{scope.row.remark}}</span>
        </template>
      </el-table-column>
       <el-table-column label="下单时间" align="center" prop="orderTime" >
         <template slot-scope="scope">
           <span>{{ parseTime(scope.row.orderTime) }}</span>
<!--           <span>{{ scope.row.orderTimeText }}</span>-->
         </template>
       </el-table-column>

      <!-- <el-table-column label="手机号" align="center" prop="receiverPhone" /> -->
      <!-- <el-table-column label="${comment}" align="center" prop="address" /> -->
      <!-- <el-table-column label="${comment}" align="center" prop="town" /> -->
      <!-- <el-table-column label="省" align="center" prop="province" /> -->
      <!-- <el-table-column label="市" align="center" prop="city" /> -->
<!--      <el-table-column label="发货时间" align="center" prop="shippingTime" />-->
<!--      <el-table-column label="快递单号" align="center" prop="shippingNumber" />-->
      <!-- <el-table-column label="物流公司" align="center" prop="shippingCompany" /> -->
<!--      <el-table-column label="状态" align="center" prop="orderStatus" >-->
<!--        <template slot-scope="scope">-->
<!--          <el-tag v-if="scope.row.orderStatus === 1" style="margin-bottom: 6px;">待发货</el-tag>-->
<!--          <el-tag v-if="scope.row.orderStatus === 2" style="margin-bottom: 6px;">已出库</el-tag>-->
<!--          <el-tag v-if="scope.row.orderStatus === 3" style="margin-bottom: 6px;">已发货</el-tag>-->
<!--          <el-tag v-if="scope.row.orderStatus === 4" style="margin-bottom: 6px;">已完成</el-tag>-->
<!--          <el-tag v-if="scope.row.orderStatus === 11" style="margin-bottom: 6px;">已取消</el-tag>-->
<!--          <br />-->
<!--          &lt;!&ndash; 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 &ndash;&gt;-->
<!--          <el-tag v-if="scope.row.refundStatus === 1">无售后或售后关闭</el-tag>-->
<!--          <el-tag v-if="scope.row.refundStatus === 2">售后处理中</el-tag>-->
<!--          <el-tag v-if="scope.row.refundStatus === 3">退款中</el-tag>-->
<!--          <el-tag v-if="scope.row.refundStatus === 4">退款成功</el-tag>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
          >详情</el-button>
          <el-row>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-warning"
              @click="handleDetail(scope.row)"
            >订单拦截</el-button>

          </el-row>

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

            <el-descriptions-item label="店铺">
              {{ shopList.find(x=>x.id === form.shopId)?shopList.find(x=>x.id === form.shopId).name:'' }}
              <el-tag size="small" v-if="form.shopType === 4">淘宝天猫</el-tag>
              <el-tag size="small" v-if="form.shopType === 5">拼多多</el-tag>
              <el-tag size="small" v-if="form.shopType === 6">抖店</el-tag>
              <el-tag size="small" v-if="form.shopType === 7">小红书</el-tag>
              <el-tag size="small" v-if="form.shopType === 13">快手小店</el-tag>
              <el-tag size="small" v-if="form.shopType === 99">其他</el-tag>
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
        <el-table :data="form.erpSaleOrderItemList"  style="margin-bottom: 10px;">
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

    <!-- 售后对话框 -->
    <el-dialog title="添加售后" :visible.sync="saleAfterOpen" width="500px" append-to-body :close-on-click-modal="false">
      <el-form ref="refundForm" :model="saleAfterForm" :rules="saleAfterRules" label-width="80px" inline>
        <el-form-item label="订单ID" prop="tid">
          <el-input v-model.number="saleAfterForm.tid" placeholder="订单ID" style="width:250px" disabled />
        </el-form-item>
        <!-- <el-form-item label="子订单ID" prop="oid">
          <el-input v-model="saleAfterForm.oid" placeholder="" style="width:250px" disabled />
        </el-form-item> -->
        <el-form-item label="商品图片" prop="productImgUrl">
          <!-- <el-image style="width: 70px; height: 70px" :src="saleAfterForm.productImgUrl"></el-image> -->
          <div style="float: left;display: flex;align-items: center;" >
            <el-image  style="width: 70px; height: 70px;" :src="saleAfterForm.productImgUrl"></el-image>
            <div style="margin-left:10px">
              <p>{{saleAfterForm.goodsTitle}}</p>
              <p>{{saleAfterForm.skuInfo}} </p>
            </div>
          </div>
        </el-form-item>
        <!-- <el-form-item label="商品名称" prop="goodsTitle">
          <el-input v-model="saleAfterForm.goodsTitle" placeholder="" style="width:250px" disabled />
        </el-form-item> -->
        <el-form-item label="退款单号" prop="refundId">
          <el-input v-model.number="saleAfterForm.refundId" placeholder="" style="width:250px" />
        </el-form-item>
        <el-form-item label="购买数量" prop="quantity">
          <el-input v-model="saleAfterForm.quantity" placeholder="" style="width:250px" disabled />
        </el-form-item>
        <el-form-item label="退货数量" prop="num">
          <el-input v-model.number="saleAfterForm.num" placeholder="" style="width:250px" />
        </el-form-item>
        <el-form-item label="总金额" prop="itemAmount">
          <el-input v-model="saleAfterForm.itemAmount" placeholder="" style="width:250px" disabled/>
        </el-form-item>
        <el-form-item label="退款金额" prop="refundFee">
          <el-input type="number" v-model.number="saleAfterForm.refundFee" placeholder="请输入退款金额" style="width:250px"/>
        </el-form-item>
        <el-form-item label="退款类型" prop="afterSalesType">
          <el-select v-model="saleAfterForm.afterSalesType" placeholder="退款类型" style="width:250px" >
            <el-option value="1" label="退货"></el-option>
            <el-option value="3" label="换货"></el-option>
            <el-option value="9" label="仅退款"></el-option>
          </el-select>
        </el-form-item>
        <!-- <el-form-item label="实际支付金额" prop="payAmount">
          <el-input v-model="form.payAmount" placeholder="请输入实际支付金额" style="width:250px"/>
        </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitRefundForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOrder, getOrder, delOrder, addOrder, updateOrder } from "@/api/order/order";
import {listShop} from "@/api/shop/shop";
import Clipboard from "clipboard";

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
      saleAfterOpen: false,
      // 总条数
      total: 0,
      // 店铺订单表格数据
      orderList: [],
      // ${subTable.functionName}表格数据
      sShopOrderItemList: [],
      shopList:[],
      // 弹出层标题
      detailTitle:'订单详情',
      detailOpen:false,
      isAudit:false,
      orderTime:null,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderNum: null,
        shopId: null,
        tag: null,
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
      saleAfterForm: {},
      // 表单校验
      rules: {

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
    amountFormatter(row, column, cellValue, index) {
      return '￥' + cellValue.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    },
    copyActiveCode(event,queryParams) {
      console.log(queryParams)
      const clipboard = new Clipboard(".tag-copy")
      clipboard.on('success', e => {
        this.$message({ type: 'success', message: '复制成功' })
        // 释放内存
        clipboard.destroy()
      })
      clipboard.on('error', e => {
        // 不支持复制
        this.$message({ type: 'waning', message: '该浏览器不支持自动复制' })
        // 释放内存
        clipboard.destroy()
      })
    },
    /** 查询店铺订单列表 */
    getList() {
      if(this.orderTime){
        this.queryParams.startTime = this.orderTime[0]
        this.queryParams.endTime = this.orderTime[1]
      }else {
        this.queryParams.startTime = null
        this.queryParams.endTime = null
      }
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
    /** 新增按钮操作 */
    handleAdd() {
      this.$router.push('/order/create');
    },

    reset(){

    },
    /** 详情 */
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
    /** 售后按钮 */
    handleRefund(row,item){
      this.saleAfterForm.tid = row.id
      this.saleAfterForm.oid = item.subItemId
      this.saleAfterForm.productImgUrl = item.productImgUrl
      this.saleAfterForm.goodsTitle = item.goodsTitle
      this.saleAfterForm.skuInfo = item.skuInfo
      this.saleAfterForm.num = item.quantity
      this.saleAfterForm.quantity = item.quantity
      this.saleAfterForm.itemAmount = item.itemAmount
      this.saleAfterForm.refundFee = item.itemAmount

      console.log('售后====',row)
      this.saleAfterOpen = true
    },
  }
};
</script>
