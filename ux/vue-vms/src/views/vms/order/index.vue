<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="订单号" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
      <el-form-item label="发货状态" prop="sendStatus">
        <el-select v-model="queryParams.sendStatus" placeholder="请选择状态" clearable @change="handleQuery">
          <el-option label="待发货" value="1" ></el-option>
          <el-option label="已发货" value="2"></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="订单状态" prop="orderStatus">
        <el-select v-model="queryParams.orderStatus" placeholder="请选择状态" clearable @change="handleQuery">
          <el-option label="待发货" value="1" ></el-option>
          <el-option label="已发货" value="2"></el-option>
          <el-option label="已完成" value="3"></el-option>
          <el-option label="已取消" value="11"></el-option>
          <el-option label="退款中" value="12"></el-option>
          <el-option label="部分发货" value="101"></el-option>
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
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdateSendStatus"
        >更新发货状态</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-printer"
          size="mini"
          @click="openWechatEInvoice"
        >微信小店电子面单</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange" >
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="订单ID" align="center" prop="id" />-->
      <el-table-column label="订单号" align="left" prop="orderNum" width="200px">
        <template slot-scope="scope">
          <el-button
          size="mini"
          type="text"
          icon="el-icon-view"
          @click="handleDetail(scope.row)"
        >{{scope.row.orderNum}} </el-button><br/>
          <el-tag type="info">{{ platformList.find(x=>x.id === scope.row.shopType) ? platformList.find(x=>x.id === scope.row.shopType).name : '' }}</el-tag>
        </template>
      </el-table-column>
<!--      <el-table-column label="店铺" align="center" prop="shopId" >-->
<!--        <template slot-scope="scope">-->
<!--          <el-tag >{{ shopList.find(x=>x.id === scope.row.shopId) ? shopList.find(x=>x.id === scope.row.shopId).name : '' }}</el-tag>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="商品明细" align="center" width="900px" >
        <template slot="header">
          <table>
            <th>
              <td width="50px">图片</td>
              <td width="250px" align="left">商品标题</td>
              <td width="150" align="left">规格</td>
              <td width="200" align="left">Sku编码</td>
              <td width="50" align="left">数量</td>
            </th>
          </table>
        </template>
        <template slot-scope="scope" >
          <el-table :data="scope.row.itemList" :show-header="false" :cell-style="{border:0 + 'px' }"  :row-style="{border:0 + 'px' }" >
            <el-table-column label="商品图片" width="50px">
              <template slot-scope="scope">
                <image-preview :src="scope.row.goodsImg" :width="40" :height="40"/>
              </template>
            </el-table-column>
            <el-table-column label="商品名" align="left" width="250px" prop="goodsName" >
              <template slot-scope="scope">
                {{scope.row.goodsName}}
                <!--                <el-tag size="small" v-if="scope.row.refundStatus === 1">无售后或售后关闭</el-tag>-->
                <el-tag size="small" v-if="scope.row.refundStatus === 2">售后处理中</el-tag>
                <el-tag size="small" v-if="scope.row.refundStatus === 3">退款中</el-tag>
                <el-tag size="small" v-if="scope.row.refundStatus === 4">退款成功</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="SKU名" align="left" prop="skuName" width="150"  :show-overflow-tooltip="true">
              <template slot-scope="scope">
                {{ getSkuValues(scope.row.skuName)}}
              </template>
            </el-table-column>
            <el-table-column label="Sku编码" align="left" prop="skuCode" width="200"/>
            <el-table-column label="商品数量" align="center" prop="quantity" width="50px">
              <template slot-scope="scope">
                <el-tag size="small" type="danger">{{scope.row.quantity}}</el-tag>
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>
      <el-table-column label="订单备注" align="center" prop="remark" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.buyerMemo}}<br />
          {{scope.row.sellerMemo}}
        </template>
      </el-table-column>
<!--      <el-table-column label="收件地址" prop="receiverName" width="200px">-->
<!--        <template slot-scope="scope">-->
<!--          {{scope.row.province}} {{scope.row.city}} {{scope.row.town}} <br />-->

<!--        </template>-->
<!--      </el-table-column>-->
      <!-- 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货-->
      <el-table-column label="订单状态" align="center" prop="orderStatus" >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.orderStatus === 1">待发货</el-tag>
          <el-tag v-if="scope.row.orderStatus === 2">已发货</el-tag>
          <el-tag v-if="scope.row.orderStatus === 3">已完成</el-tag>
          <el-tag v-if="scope.row.orderStatus === 11">已取消</el-tag>
          <el-tag v-if="scope.row.orderStatus === 12">退款中</el-tag>
          <el-tag v-if="scope.row.orderStatus === 101">部分发货</el-tag>

        </template>
      </el-table-column>
      <el-table-column label="发货状态" align="center" prop="sendStatus" >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.sendStatus === 1">待发货</el-tag>
          <el-tag v-if="scope.row.sendStatus === 2">已发货</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="发货信息" align="center" prop="shippingNumber" >
        <template slot-scope="scope">
          {{scope.row.shippingNumber}}&nbsp; {{scope.row.shippingCompany}}<br />
          {{ parseTime(scope.row.shippingTime, '{y}-{m}-{d} {h}:{m}:{s}') }}
        </template>
      </el-table-column>
      <el-table-column label="下单时间" align="center" prop="orderTime" >
        <template slot-scope="scope">
          {{ parseTime(scope.row.orderTime) }}
        </template>
      </el-table-column>
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-view"-->
<!--            @click="handleDetail(scope.row)"-->
<!--          >详情</el-button>-->
<!--            <el-button-->
<!--              size="mini"-->
<!--              type="success"-->
<!--              icon="el-icon-share"-->
<!--              @click="handleShip(scope.row)"-->
<!--            >订单发货</el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->
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
      <el-tabs v-model="activeName" >
        <el-tab-pane label="订单详情" name="orderDetail">
          <el-form ref="form" :model="form" :rules="rules" label-width="80px" inline>
            <el-descriptions title="订单信息">
              <el-descriptions-item label="ID">{{form.id}}</el-descriptions-item>
              <el-descriptions-item label="订单号">{{form.orderNum}}</el-descriptions-item>

              <el-descriptions-item label="平台">
                {{ platformList.find(x=>x.id === form.shopType)?platformList.find(x=>x.id === form.shopType).name:'' }}

              </el-descriptions-item>
              <el-descriptions-item label="买家留言">
                {{form.buyerMemo}}
              </el-descriptions-item>
              <el-descriptions-item label="卖家留言">
                {{form.sellerMemo}}
              </el-descriptions-item>

              <el-descriptions-item label="备注">
                {{form.remark}}
              </el-descriptions-item>
              <el-descriptions-item label="创建时间">
                {{ parseTime(form.createTime) }}
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
                <el-tag v-if="form.orderStatus === 2" style="margin-bottom: 6px;">已出库</el-tag>
                <el-tag v-if="form.orderStatus === 3" style="margin-bottom: 6px;">已发货</el-tag>
              </el-descriptions-item>
              <el-descriptions-item label="退款状态">
                <el-tag v-if="form.refundStatus === 1">无售后或售后关闭</el-tag>
                <el-tag v-if="form.refundStatus === 2">售后处理中</el-tag>
                <el-tag v-if="form.refundStatus === 3">退款中</el-tag>
                <el-tag v-if="form.refundStatus === 4">退款成功</el-tag>
              </el-descriptions-item>

            </el-descriptions>
<!--            <el-descriptions title="付款信息">-->
<!--              <el-descriptions-item label="商品总额">{{amountFormatter(null,null,form.goodsAmount,0)}}</el-descriptions-item>-->
<!--              <el-descriptions-item label="订单金额">{{amountFormatter(null,null,form.amount,0)}}</el-descriptions-item>-->
<!--              <el-descriptions-item label="实际支付金额">{{amountFormatter(null,null,form.payment,0)}}</el-descriptions-item>-->
<!--              <el-descriptions-item label="平台优惠金额">{{amountFormatter(null,null,form.platformDiscount,0)}}</el-descriptions-item>-->
<!--              <el-descriptions-item label="商家优惠金额">{{amountFormatter(null,null,form.sellerDiscount,0)}}</el-descriptions-item>-->
<!--            </el-descriptions>-->


            <el-descriptions title="收货信息">
              <el-descriptions-item label="收件人姓名">{{form.receiverName}}</el-descriptions-item>
              <el-descriptions-item label="收件人手机号">{{form.receiverMobile}}</el-descriptions-item>
              <el-descriptions-item label="省市区">{{form.province}}{{form.city}}{{form.town}}</el-descriptions-item>
              <el-descriptions-item label="详细地址">{{form.address}}</el-descriptions-item>
            </el-descriptions>
<!--            <el-descriptions title="发货信息">-->

<!--              <el-descriptions-item label="物流公司">{{form.shippingCompany}}</el-descriptions-item>-->
<!--              <el-descriptions-item label="物流单号">{{form.shippingNumber}}</el-descriptions-item>-->
<!--              <el-descriptions-item label="发货时间">{{form.shippingTime}}</el-descriptions-item>-->
<!--            </el-descriptions>-->

          </el-form>

        </el-tab-pane>
        <el-tab-pane label="商品列表" name="orderItems" lazy>
          <el-table :data="form.itemList"  style="margin-bottom: 10px;">
            <!-- <el-table-column type="selection" width="50" align="center" /> -->
            <el-table-column label="序号" align="center" type="index" width="50"/>

            <el-table-column label="商品图片" prop="goodsImg" width="80">
              <template slot-scope="scope">
                <el-image style="width: 70px; height: 70px" :src="scope.row.goodsImg"></el-image>
              </template>
            </el-table-column>
            <el-table-column label="商品名" prop="goodsName" ></el-table-column>

            <el-table-column label="SKU名" align="left" prop="skuName" width="250"  :show-overflow-tooltip="true">
              <template slot-scope="scope">
                {{ getSkuValues(scope.row.skuName)}}
              </template>
            </el-table-column>
            <el-table-column label="Sku编码" align="left" prop="skuCode" width="180"/>
            <el-table-column label="数量" align="center" prop="quantity" width="50px">
              <template slot-scope="scope">
                <el-tag size="small" type="danger">{{scope.row.quantity}}</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="退款状态" align="left" prop="refundStatus" >
              <template slot-scope="scope">
                <el-tag size="small" v-if="scope.row.refundStatus === 1">无售后</el-tag>
                <el-tag size="small" v-if="scope.row.refundStatus === 2">售后处理中</el-tag>
                <el-tag size="small" v-if="scope.row.refundStatus === 3">退款中</el-tag>
                <el-tag size="small" v-if="scope.row.refundStatus === 4">退款成功</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="发货状态" prop="sendStatus">
              <template slot-scope="scope">
                <el-tag v-if="scope.row.sendStatus === 1">待发货</el-tag>
                <el-tag v-if="scope.row.sendStatus === 2">已发货</el-tag>
              </template>
            </el-table-column>

          </el-table>
        </el-tab-pane>
<!--        <el-tab-pane label="发货物流" name="orderLog" lazy>-->

<!--        </el-tab-pane>-->
      </el-tabs>
    </el-dialog>

    <!-- 微信小店电子面单弹窗 -->
    <el-dialog
      title="微信小店电子面单"
      :visible.sync="wechatEInvoiceVisible"
      width="80%"
      append-to-body
    >
      <wechat-e-invoice @close="wechatEInvoiceVisible = false" />
    </el-dialog>
  </div>
</template>

<script>
// 建议：确保已安装 Volar（Vue 3）或 Vetur（Vue 2）插件，并重启 VSCode
// 建议：项目根目录添加 jsconfig.json 或 tsconfig.json，示例见下方注释
// 建议：保持 <template>、<script>、<style> 标签顺序规范
// 建议：方法、参数命名规范，避免语法错误

import {listOrder, getOrder, updateSendStatus} from "@/api/vms/order";
import {listPlatform} from "@/api/vms/shop";
import WechatEInvoice from './wechatEInvoice.vue';

export default {
  name: "Order",
  components: {
    WechatEInvoice
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      pushLoading: false,
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
      platformList:[],
      // 弹出层标题
      detailTitle:'订单详情',
      detailOpen:false,
      isAudit:false,
      activeName: 'orderDetail',
      orderTime: null,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderNum: null,
        shopId: null,
        startTime: null,
        endTime: null,
        refundStatus: null,
        orderStatus: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      wechatEInvoiceVisible: false
    };
  },
  created() {
    listPlatform({status:0}).then(res => {
      this.platformList = res.rows;
      this.getList();
    })

  },
  methods: {
    getSkuValues(spec){
      try {
        // 解析 JSON，返回一个数组
        const parsedSpec = JSON.parse(spec) || [];

        // 使用 map 提取所有 value，使用 join() 用逗号连接
        return parsedSpec.map(item => item.attr_value || item.value).join(', ') || '';
      } catch (error) {
        return spec; // 如果 JSON 解析出错，返回空字符串
      }
    },
    amountFormatter(row, column, cellValue, index) {
      return '￥' + parseFloat(cellValue).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.$router.push('/order/create');
    },
    /** 查询店铺订单列表 */
    getList() {
      console.log('=====搜索条件：=====',this.queryParams)
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
      this.orderTime=null
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },

    reset(){

    },
    handlePushErp(row){
      const id = row.id || this.ids
      this.pushLoading = true
      pushErp(id).then(response => {
        console.log('======返回====',response)
        this.$modal.msgSuccess("推送成功！请在订单详情查看推送结果！");
        this.pushLoading = false
        this.getList()
      });
    },
    handleShip(row){

    },
    /** 详情按钮操作 */
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
    // 更新发货状态
    handleUpdateSendStatus(row){
      const id = row.id || this.ids
      updateSendStatus(id).then(response => {
        this.$modal.msgSuccess("更新成功");
        this.getList()
      });
    },
    openWechatEInvoice() {
      this.wechatEInvoiceVisible = true;
    }
  }
};
</script>

<!-- 建议：在项目根目录添加 jsconfig.json（如果用 JS）或 tsconfig.json（如果用 TS） -->
<!-- 例如 jsconfig.json: -->
<!--
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"]
    }
  },
  "exclude": ["node_modules", "dist"]
}
-->
<!-- 添加后重启 VSCode 并等待索引完成 -->

<!-- 如仍无法跳转，请确认依赖已安装（npm install），并检查插件是否启用 -->

<!-- 已安装 Vetur 并配置 jsconfig.json，通常已支持跳转。
如仍无法跳转：
1. 重启 VSCode。
2. 确认依赖已安装（npm install）。
3. 检查是否有语法错误。
4. 等待 Vetur 索引完成。 -->

