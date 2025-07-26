<template>
  <div class="app-container">
    <el-form :model="printParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单号" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="店铺" prop="shopId">
        <el-select v-model="queryParams.shopId" placeholder="请选择店铺" @change="handleQuery">
          <el-option
            v-for="item in shopList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
            <span style="float: left">{{ item.name }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 1">淘宝天猫</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 2">京东</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 3">拼多多</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">抖店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 5">微信小店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 9">其他渠道</span>
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
        <el-select size="mini" v-model="printParams.printer" placeholder="请选择打印机" clearable>
          <el-option
            v-for="item in printerList"
            :key="item.name"
            :label="item.name"
            :value="item.name">
          </el-option>
        </el-select>

      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-time"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleGetEwaybillCode"-->
<!--        >新单号打印</el-button>-->
<!--      </el-col>-->

      <el-col :span="1.5">

        <el-button
          type="success"
          plain
          :disabled="multiple"
          icon="el-icon-printer"
          size="mini"
          @click="handlePrintEwaybill"
        >原单号打印</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-d-arrow-right"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleShipSend"-->
<!--        >电子面单发货</el-button>-->
<!--      </el-col>-->

<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handlePrintEwaybill"-->
<!--        >打印电子面单</el-button>-->
<!--      </el-col>-->


      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="ID" align="center" prop="id" />-->
      <el-table-column label="订单号" align="left" prop="orderNum" width="200">
        <template slot-scope="scope">
          <span>{{scope.row.orderNum}}</span>
          <el-tag>{{ parseTime(scope.row.orderTime) }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="商品明细" align="center" width="900px" >
        <template slot="header">
          <table>
            <th>
              <td width="50px">图片</td>
              <td width="250px" align="left">标题</td>
              <td width="150" align="left">SKU名</td>
              <td width="200" align="left">Sku编码</td>
              <td width="150" align="left">系统SkuId</td>
              <td width="50" align="left">数量</td>
            </th>
          </table>
        </template>
        <template slot-scope="scope" >
          <el-table :data="scope.row.itemList" :show-header="false" :cell-style="{border:0 + 'px' }"  :row-style="{border:0 + 'px' }" >
            <el-table-column label="商品图片" width="50px">
              <template slot-scope="scope">
                <!--                <el-image  style="width: 40px; height: 40px;" :src="scope.row.goodsImg" :preview-src-list="[scope.row.goodsImg]"></el-image>-->
                <image-preview :src="scope.row.goodsImg" :width="40" :height="40"/>
              </template>
            </el-table-column>
            <el-table-column label="商品名" align="left" width="250px" prop="goodsTitle" >
              <template slot-scope="scope">
                {{scope.row.goodsTitle}}
                <!--                <el-tag size="small" v-if="scope.row.refundStatus === 1">无售后或售后关闭</el-tag>-->
                <el-tag size="small" v-if="scope.row.refundStatus === 2">售后处理中</el-tag>
                <el-tag size="small" v-if="scope.row.refundStatus === 3">退款中</el-tag>
                <el-tag size="small" v-if="scope.row.refundStatus === 4">退款成功</el-tag>
                <el-tag size="small" v-if="scope.row.refundStatus === 11">已取消</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="SKU名" align="left" prop="goodsSpec" width="150"  :show-overflow-tooltip="true">
              <template slot-scope="scope">
                {{ getSkuValues(scope.row.goodsSpec)}}
              </template>
            </el-table-column>
            <el-table-column label="Sku编码" align="left" prop="skuNum" width="200"/>
            <el-table-column label="系统SkuId" align="left" prop="erpSkuId" width="150"/>
            <el-table-column label="商品数量" align="center" prop="quantity" width="50px">
              <template slot-scope="scope">
                <el-tag size="small" type="danger">{{scope.row.quantity}}</el-tag>
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>
<!--      <el-table-column label="下单时间" align="center" prop="orderCreateTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.orderTime) }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="订单备注" align="center" >
        <template slot-scope="scope">
          <div style="color: #ed5565">{{scope.row.remark}}</div>
          <div style="color: #ed5565">{{scope.row.buyerMemo}}</div>
          <div style="color: #ed5565">{{scope.row.sellerMemo}}</div>
        </template>
      </el-table-column>
<!--      <el-table-column label="收件人" prop="receiverName" width="200px">-->
<!--        <template slot-scope="scope">-->
<!--          {{scope.row.receiverName}}&nbsp;-->
<!--          {{scope.row.receiverMobile}} <br />-->
<!--          {{scope.row.province}} {{scope.row.city}} {{scope.row.town}} <br />-->

<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="面单号" align="center" prop="waybillCode" />
      <el-table-column label="快递公司" align="center" prop="waybillCompany" />
<!--      <el-table-column label="取号状态" align="center" prop="waybillStatus" >-->
<!--        <template slot-scope="scope">-->
<!--          <el-tag size="small" v-if="scope.row.waybillStatus==0">未取号</el-tag>-->
<!--          <el-tag size="small" v-if="scope.row.waybillStatus==1">已取号</el-tag>-->
<!--          <el-tag size="small" v-if="scope.row.waybillStatus==2">已打印</el-tag>-->
<!--          <el-tag size="small" v-if="scope.row.waybillStatus==3">已发货</el-tag>-->
<!--          <el-tag size="small" v-if="scope.row.waybillStatus==10">手动发货</el-tag>-->
<!--          <br />-->
<!--&lt;!&ndash;          <el-button type="text" size="small"  @click="cancelCode(scope.row)" v-if="scope.row.waybillStatus==1 || scope.row.waybillStatus==2">取消取号</el-button>&ndash;&gt;-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            plain-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleCancelWaybill(scope.row)"-->
<!--          >回收单号</el-button>-->
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

    <!-- 取号 -->
    <el-dialog title="新单号打印" :visible.sync="getCodeOpen" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="电子面单账户" prop="accountId">
          <el-select v-model="form.accountId" placeholder="请选择电子面单账户" clearable>
            <el-option
              v-for="item in deliverList"
              :key="item.id"
              :label="item.deliveryId"
              :value="item.id">
              <span style="float: left">{{ item.deliveryId }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px" >{{item.siteName}}:{{item.available}}</span>
            </el-option>
          </el-select>

        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="getCodeOpenForm">取号并发货</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


  </div>
</template>

<script>
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import {
  getOrder,
  manualShipmentOrder,
  allocateShipmentOrder, selfShippedList
} from "@/api/order/order";

import {listShop} from "@/api/shop/shop";
import {parseTime} from "@/utils/zhijian";
import {MessageBox} from "element-ui";
import {isRelogin} from "@/utils/request";
import {cancelWaybillCode} from "@/api/shop/pdd/ewaybill";

export default {
  name: "ShippedListPdd",
  data() {
    return {
      // 遮罩层
      loading: true,
      getCodeOpen: false,
      // 选中数组
      ids: [],
      shopList: [],
      orderList: [],
      logisticsList: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      shipOpen: false,
      allocateShipmentOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shopType:3,
        shopId: null,
        shipType:1
      },
      // 打印参数
      printParams: {
        deliver: null,
        printer: null
      },
      // 表单参数
      form: {
        weight:0.0
      },
      printerList: [],
      deliverList: [],
      // 表单校验
      rules: {
        height: [{ required: true, message: '不能为空' }],
        weight: [{ required: true, message: '不能为空' }],
        shippingNumber: [{ required: true, message: '不能为空' }],
        shippingCompany: [{ required: true, message: '不能为空' }],
        shippingCost: [{ required: true, message: '不能为空' }],
        // shippingMan: [{ required: true, message: '不能为空' }],
        receiverName: [{ required: true, message: '不能为空' }],
        receiverMobile: [{ required: true, message: '不能为空' }],
        address: [{ required: true, message: '不能为空' }],
      }
    };
  },
  created() {
    this.openWs()
    listShop({type:3}).then(response => {
      this.shopList = response.rows;
      if (this.shopList && this.shopList.length > 0) {
        this.queryParams.shopId = this.shopList[0].id
      }
      this.getList();
    });

  },
  methods: {
    parseTime,
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
    /** 查询列表 */
    getList() {
      this.loading = true;
      selfShippedList(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    // 取号弹窗
    handleGetEwaybillCode() {
      if (this.queryParams.shopId) {
        const ids = this.ids;
        if (ids) {
          getWaybillAccountList({shopId: this.queryParams.shopId}).then(response => {
            this.deliverList = response.rows;
            if (response.rows && response.rows.length > 0) {
              this.form.accountId = response.rows[0].id
            }

            this.getCodeOpen = true
          });
        } else {
          this.$modal.msgError("请选择订单")
        }
      } else {
        this.$modal.msgError("请选择店铺")
      }
    },

    /** 取号提交按钮 */
    getCodeOpenForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          const ids = this.ids;
          console.log('=========3333========', ids)
          if (ids) {
            console.log('===请求参数=====', {shopId: this.queryParams.shopId, ids: ids, accountId: this.form.accountId})
            getWaybillCodeAndSend({
              shopId: this.queryParams.shopId,
              ids: ids,
              accountId: this.form.accountId
            }).then(response => {
              console.log('电子面单取号接口返回=====', response)
              if (response.code == 200) {
                this.$modal.msgSuccess("取号成功")
                this.getList()
                this.getCodeOpen = false
              } else if (response.code === 1401) {
                MessageBox.confirm('Token已过期，需要重新授权！请前往店铺列表重新获取授权！', '系统提示', {
                  confirmButtonText: '前往授权',
                  cancelButtonText: '取消',
                  type: 'warning'
                }).then(() => {
                  this.$router.push({path: "/shop/list", query: {type: 3}})
                }).catch(() => {
                  isRelogin.show = false;
                });
              } else {
                this.$modal.msgError(JSON.stringify(response));
                this.pullLoading = false
              }


            });
          } else {
            this.$modal.msgError("请选择订单")
          }
        }
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.allocateShipmentOpen = false;
      this.shipOpen = false;
      this.getCodeOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        erpSkuId: null
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
        console.log('=====00000000============',response)
        this.form = response.data;
        this.open = true;
      });
    },
    openWs() {
      const ws = new WebSocket('ws://127.0.0.1:5000');
      ws.onopen = () => {
        console.log('与打印组件建立连接成功: ');
        // 或打印机
        ws.send(JSON.stringify({
          requestID: '1234554',
          cmd: 'getPrinters',
          "version": "1.0"
        }))
      };
      let obj = this.$modal;
      ws.onmessage = (e) => {
        const resp = JSON.parse(e.data || '{}')
        if (resp.cmd === 'getPrinters') {
          this.printerList = resp.printers
          obj.msgSuccess("打印组件连接成功！");
          console.log('打印机列表: ', resp.printers);
        }
      };
      // 当发生错误时触发
      ws.onerror = function (error) {
        obj.msgError("打印组件连接失败！请安装并启动拼多多打印组件！");
        console.error('WebSocket error:', error);
        // alert('WebSocket error occurred. Check the console for more details.');
      };
    },
    handlePrintEwaybill() {
      if (!this.printParams.printer) {
        this.$modal.msgError('请选择打印机！');
        return
      }
      const ids = this.ids;
      getWaybillPrintData({shopId: this.queryParams.shopId, ids: ids}).then(response => {
        console.log("======打印======", response.data)
        if (response.data && response.data.length>0) {
          const ws = new WebSocket('ws://127.0.0.1:5000');
          ws.onopen = () => {
            // let printData = []
            // response.data.forEach(x => printData.push(JSON.parse(x.printData)))

            response.data.forEach(x =>{
              let printData = JSON.parse(x.printData)
              console.log('开始打印: 组合打印数据：', printData);
              // 打印
              ws.send(JSON.stringify({
                "cmd": "print",
                "requestID": this.getUUID(8, 16),
                "version": "1.0",
                "task": {
                  "taskID": this.getUUID(8,10),
                  "preview": false,
                  "printer": this.printParams.printer,
                  "previewType": "pdf",
                  "firstDocumentNumber": 10,
                  "totalDocumentCount": 100,
                  "documents": [{
                    "documentID": this.getUUID(8,10),
                    // "contents": printData,
                    "contents":[
                      {
                        "encryptedData": printData.encryptedData,
                        "signature": printData.signature,
                        "templateUrl": printData.templateUrl,
                        "ver": printData.ver,
                      },
                      {
                        "data":{
                          "height":240,
                          "list":[
                            {
                              "fontSize":31.2,
                              "height":85.68,
                              "left":25.08,
                              "text": x.printText,
                              "top":25.08,
                              "width":413.52
                            }
                          ],
                          "waterdata":{
                            "text":""
                          },
                          "width":560
                        },
                        "templateURL":"http://pinduoduoimg.yangkeduo.com/logistics/2019-07-14/5d7e8b5969d954539fcfba3268bbeb3a.xml"
                      }
                    ],
                  }]
                }
              }))
            })
          };
          let obj = this.$modal;
          ws.onmessage = (e) => {
            const resp = JSON.parse(e.data || '{}')
            if (resp.cmd === 'print') {
              console.log('打印结果: ', resp);
              obj.msgSuccess("打印成功！" + JSON.stringify(resp));
              // 请求回调
              return pushWaybillPrintSuccess({shopId: this.queryParams.shopId, ids: ids})
            }
          };


          // 当发生错误时触发
          ws.onerror = function (error) {
            obj.msgError("打印失败！");
            console.error('WebSocket error:', error);
            // alert('WebSocket error occurred. Check the console for more details.');
          };
        }else{
          this.$modal.msgError('没有电子面单信息！');
        }
      });
    },
    getUUID(len, radix) {
      var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
      var uuid = [], i;
      radix = radix || chars.length;
      if (len) {
        for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random() * radix];
      } else {
        var r;
        uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
        uuid[14] = '4';
        for (i = 0; i < 36; i++) {
          if (!uuid[i]) {
            r = 0 | Math.random() * 16;
            uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
          }
        }
      }
      return uuid.join('');
    },

  }
};
</script>
