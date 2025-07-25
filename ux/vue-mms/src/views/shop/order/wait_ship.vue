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
      <el-form-item label="订单状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable @change="handleQuery">
          <el-option label="待付款" value="10" ></el-option>
          <el-option label="礼物待收下" value="12" ></el-option>
          <el-option label="待发货" value="20"></el-option>
          <el-option label="部分发货" value="21"> </el-option>
          <el-option label="待收货" value="30"> </el-option>
          <el-option label="完成" value="100"> </el-option>
          <el-option label="售后完成订单取消" value="200"> </el-option>
          <el-option label="订单取消" value="250"> </el-option>
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
        >API拉取订单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-refresh"
          size="mini"
          :disabled="multiple"
          @click="handlePushOms"
        >重新推送选中订单到订单库</el-button>
      </el-col>

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange" >
      <el-table-column type="selection" width="55" align="center" :selectable="isRowSelectable" />


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
      <el-table-column label="商品" width="350">
        <template slot-scope="scope">
          <el-row v-for="item in scope.row.items" :key="item.id" :gutter="20">

            <div style="float: left;display: flex;align-items: center;" >
              <span>
              <image-preview :src="item.img" :width="50" :height="50"/>
                </span>
              <div style="margin-left:10px">
                <div>{{item.title}}</div>
                <div><el-tag type="info" size="small">{{item.skuName}}</el-tag></div>
                <div><span v-if="item.skuId">平台ID：{{item.skuId}}</span>
                  <el-tag size="small">数量： {{item.quantity}}</el-tag>
                </div>
              </div>
            </div>
          </el-row>
        </template>
      </el-table-column>
      <el-table-column label="订单金额" align="center" prop="orderPrice" :formatter="amountFormatter">
        <template slot-scope="scope">
          <span>{{ amountFormatter(null,null,scope.row.orderAmount/100,null) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="下单时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
<!--          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>-->
          {{scope.row.orderTimeText}}
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

      <el-table-column label="订单状态" align="center" prop="status" >
        <!--订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货-->
        <!--售后状态 0：无售后 2：买家申请退款，待商家处理 3：退货退款，待商家处理 4：商家同意退款，退款中 5：平台同意退款，退款中 6：驳回退款，待买家处理 7：已同意退货退款,待用户发货
        8：平台处理中 9：平台拒绝退款，退款关闭 10：退款成功 11：买家撤销 12：买家逾期未处理，退款失败 13：买家逾期，超过有效期 14：换货补寄待商家处理 15：换货补寄待用户处理
        16：换货补寄成功 17：换货补寄失败 18：换货补寄待用户确认完成 21：待商家同意维修 22：待用户确认发货 24：维修关闭 25：维修成功 27：待用户确认收货
        31：已同意拒收退款，待用户拒收 32：补寄待商家发货 33：同意召回后退款，待商家召回-->

        <template slot-scope="scope">
          <span v-if="scope.row.afterSalesStatus === 0">
            <el-tag v-if="scope.row.orderStatus === 1 " size="small">待发货</el-tag>
            <el-tag v-if="scope.row.orderStatus === 2 " size="small">已发货</el-tag>
            <el-tag v-if="scope.row.orderStatus === 3 " size="small">已完成</el-tag>

          </span>
          <span v-else>
            <el-tag v-if="scope.row.afterSalesStatus === 2 " size="small">买家申请退款，待商家处理</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 3 " size="small">退货退款，待商家处理</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 4 " size="small">商家同意退款，退款中</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 5 " size="small">平台同意退款，退款中</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 6 " size="small">驳回退款，待买家处理</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 7 " size="small">已同意退货退款,待用户发货</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 8 " size="small">平台处理中</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 9 " size="small">平台拒绝退款，退款关闭</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 10 " size="small">已退款</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 11 " size="small">买家撤销</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 12 " size="small">买家逾期未处理，退款失败</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 13 " size="small">买家逾期，超过有效期</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 14 " size="small">换货补寄待商家处理</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 15 " size="small">换货补寄待用户处理</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 16 " size="small">换货补寄成功</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 17 " size="small">换货补寄失败</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 18 " size="small">换货补寄待用户确认完成</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 21 " size="small">待商家同意维修</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 22 " size="small">待用户确认发货</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 24 " size="small">维修关闭</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 25 " size="small">维修成功</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 27 " size="small">待用户确认收货</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 31 " size="small">已同意拒收退款，待用户拒收</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 32 " size="small">补寄待商家发货</el-tag>
            <el-tag v-if="scope.row.afterSalesStatus === 33 " size="small">同意召回后退款，待商家召回</el-tag>
          </span>

        </template>
      </el-table-column>
<!--      <el-table-column label="快递单号" align="center" prop="logisticsCode" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-refresh"
            :loading="pullLoading"
            @click="handlePullUpdate(scope.row)"
          >更新订单</el-button>

          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['xhs:order:remove']"
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

    <!-- 确认订单、订单详情对话框 -->
    <el-dialog :title="detailTitle" :visible.sync="detailOpen" width="1100px" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="100px" inline>
        <el-descriptions title="订单信息">
          <el-descriptions-item label="ID">{{form.id}}</el-descriptions-item>
          <el-descriptions-item label="订单号">{{form.orderId}}</el-descriptions-item>
          <el-descriptions-item label="店铺">
            <el-tag > {{ shopList.find(x=>x.id === form.shopId)?shopList.find(x=>x.id === form.shopId).name:'' }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="创建时间">
            {{ parseTime(form.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}
          </el-descriptions-item>


          <el-descriptions-item label="订单状态">
            <el-tag v-if="form.status === 10 " size="small">待付款</el-tag>
            <el-tag v-if="form.status === 12 " size="small">礼物待收下</el-tag>
            <el-tag v-if="form.status === 20 " size="small">待发货</el-tag>
            <el-tag v-if="form.status === 21 " size="small">部分发货</el-tag>
            <el-tag v-if="form.status === 30 " size="small">待收货</el-tag>
            <el-tag v-if="form.status === 100 " size="small">完成</el-tag>
            <el-tag v-if="form.status === 200 " size="small">售后完成订单取消</el-tag>
            <el-tag v-if="form.status === 250 " size="small">订单自动取消</el-tag>
          </el-descriptions-item>


        </el-descriptions>
        <el-descriptions title="付款信息">

          <el-descriptions-item label="商品总价">{{amountFormatter(null,null,form.productPrice /100,null)}}</el-descriptions-item>
          <el-descriptions-item label="优惠金额">{{amountFormatter(null,null,form.discountedPrice /100,null)}}</el-descriptions-item>

          <el-descriptions-item label="运费">{{amountFormatter(null,null,form.freight / 100,null)}}</el-descriptions-item>
          <el-descriptions-item label="订单金额">{{amountFormatter(null,null,form.orderPrice / 100,null)}}</el-descriptions-item>

        </el-descriptions>


        <el-descriptions title="收货信息">
          <el-descriptions-item label="收件人姓名">{{form.userName}}</el-descriptions-item>
          <el-descriptions-item label="收件人手机号">{{form.telNumber}}</el-descriptions-item>
          <el-descriptions-item label="省市区">{{form.provinceName}}{{form.cityName}}{{form.countyName}}</el-descriptions-item>
          <el-descriptions-item label="详细地址">{{form.detailInfo}}</el-descriptions-item>
        </el-descriptions>
<!--        <el-descriptions title="发货信息">-->
<!--          &lt;!&ndash; <el-descriptions-item label="发货方式">-->
<!--            <el-tag v-if="form.shipType === 1"  type="danger">供应商代发</el-tag>-->
<!--              <el-tag v-if="form.shipType === 0" type="danger">仓库发货</el-tag>-->
<!--          </el-descriptions-item> &ndash;&gt;-->
<!--          <el-descriptions-item label="物流公司">{{form.expressCompanyCode}}</el-descriptions-item>-->
<!--          <el-descriptions-item label="物流单号">{{form.expressTrackingNo}}</el-descriptions-item>-->
<!--          <el-descriptions-item label="发货时间"></el-descriptions-item>-->
<!--        </el-descriptions>-->
        <el-divider content-position="center">订单商品</el-divider>
        <el-table :data="goodsList"  style="margin-bottom: 10px;">
          <el-table-column label="序号" align="center" type="index" width="50"/>

          <el-table-column label="商品图片" width="80">
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.thumbImg"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="商品标题" prop="title" ></el-table-column>
          <el-table-column label="SKU属性" prop="skuAttrs" >
            <template slot-scope="scope">
              {{ getSkuValues(scope.row.skuAttrs)}}
            </template>
          </el-table-column>
          <el-table-column label="sku编码" prop="skuCode"></el-table-column>
          <el-table-column label="单价" prop="salePrice">
            <template slot-scope="scope">
              {{amountFormatter(null,null,scope.row.salePrice / 100) }}
            </template>
          </el-table-column>
          <el-table-column label="数量" prop="skuCnt"></el-table-column>
          <el-table-column label="子订单金额" prop="realPrice">
            <template slot-scope="scope">
              {{amountFormatter(null,null,scope.row.realPrice / 100) }}
            </template>
          </el-table-column>
        </el-table>

        <el-form-item label="收件人姓名" prop="userName" v-if="isAudit">
          <el-input v-model="form.userName" placeholder="请输入收件人姓名" style="width:250px" />
        </el-form-item>
        <el-form-item label="收件人电话" prop="telNumber" v-if="isAudit">
          <el-input v-model="form.telNumber" placeholder="请输入收件人电话" style="width:250px" />
        </el-form-item>

        <el-form-item label="详细地址" prop="detailInfo" v-if="isAudit">
          <el-input v-model="form.detailInfo" placeholder="请输入收件地址" style="width:250px" />
        </el-form-item>

      </el-form>

    </el-dialog>

  </div>
</template>

<script>

import { listShop } from "@/api/shop/shop";
import {listOrder,getOrder,pushOms,pullOrder,pullOrderDetail} from "@/api/wei/order";
import {pcaTextArr} from "element-china-area-data";
import Clipboard from "clipboard";
import {listShopOrder} from "@/api/shop/order";

export default {
  name: "OrderWaitShip",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      pullLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      multiple: true,
      orderTime:null,
      // 总条数
      total: 0,
      // 淘宝订单表格数据
      orderList: [],
      shopList:[],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shopId: null,
        tid: null,
        status: null
      },
      isAudit:false,
      detailOpen:false,
      detailTitle:'',
      goodsList:[],
      pcaTextArr,
      // 表单参数
      form: {
      },
      rules: {
        userName: [{ required: true, message: "收件人姓名不能为空", trigger: "blur" }],
        telNumber: [{ required: true, message: "收件人电话不能为空", trigger: "blur" }],
        detailInfo: [{ required: true, message: "收件人详情不能为空", trigger: "blur" }],
      }
    };
  },
  created() {
    listShop({}).then(response => {
      this.shopList = response.rows;
      if (this.shopList && this.shopList.length > 0) {
        // this.queryParams.shopId = this.shopList[0].id
      }
      this.getList();
    });
    // this.getList();
  },
  methods: {
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
    amountFormatter(row, column, cellValue, index) {
      return '￥' + parseFloat(cellValue).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    },
    /** 查询淘宝订单列表 */
    getList() {
      this.loading = true;
      if(this.orderTime){
        this.queryParams.startTime = this.orderTime[0]
        this.queryParams.endTime = this.orderTime[1]
      }else {
        this.queryParams.startTime = null
        this.queryParams.endTime = null
      }
      listShopOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.detailOpen = false;
      this.saleAfterOpen = false
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        shopId: null
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
    isRowSelectable(row, index) {
      return !row.confirmStatus || row.confirmStatus === 0 ;
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handlePull() {
      if(this.queryParams.shopId){
        this.pullLoading = true
        pullOrder({shopId:this.queryParams.shopId}).then(response => {
          console.log('拉取订单接口返回=====',response)
            this.$modal.msgSuccess(JSON.stringify(response));
            this.pullLoading = false
            this.getList()
        })
      }else{
        this.$modal.msgSuccess("请先选择店铺");
      }

      // this.$modal.msgSuccess("请先配置API");
    },
    handlePullUpdate(row) {
      // 接口拉取订单并更新
      this.pullLoading = true
      pullOrderDetail({shopId:row.shopId,orderId:row.orderId}).then(response => {
        console.log('拉取订单详情返回接口返回=====',response)
        this.$modal.msgSuccess(JSON.stringify(response));
        this.pullLoading = false
      })
    },
    handleDetail(row) {
      this.reset();
      const id = row.id
      getOrder(id).then(response => {
        this.form = response.data;
        this.goodsList = response.data.items;
        this.detailOpen = true;
        this.detailTitle = "订单详情";
        this.isAudit = false
      });
    },
    handlePushOms(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否批量重新推送订单？').then(function() {
        return pushOms({ids:ids});
      }).then(() => {
        // this.getList();
        this.$modal.msgSuccess("推送成功");
      }).catch(() => {});
    },


  }
};
</script>
