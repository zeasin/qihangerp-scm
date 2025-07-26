<template>
  <div class="app-container"  element-loading-text="取号中" v-loading="pageLoading">
    <el-row>
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="订单号" prop="orderSn">
          <el-input
            v-model="queryParams.orderSn"
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
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>

<!--        <el-form-item>-->
<!--          <el-select v-model="printParams.printer" placeholder="请选择打印机" clearable>-->
<!--            <el-option-->
<!--              v-for="item in printerList"-->
<!--              :key="item.name"-->
<!--              :label="item.name"-->
<!--              :value="item.name">-->
<!--            </el-option>-->
<!--          </el-select>-->

<!--        </el-form-item>-->
      </el-form>

    </el-row>


    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-select size="mini" v-model="form.accountId" placeholder="请选择电子面单账户" clearable>
          <el-option
              v-for="item in deliverList"
              :key="item.id"
              :label="item.branchName"
              :value="item.id">
            <span style="float: left">{{ item.wpCode }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px" >{{item.branchName}}:{{item.quantity}}</span>
          </el-option>
        </el-select>
<!--        <el-button type="text" plain @click="updateWaybillAccount" >更新电子面单账户信息</el-button>-->
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          :loading="pageLoading"
          icon="el-icon-printer"
          size="mini"
          :disabled="multiple"
          @click="getCodeOpenForm"
        >打印快递单</el-button>
      </el-col>

<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          :disabled="multiple"-->
<!--          icon="el-icon-printer"-->
<!--          size="mini"-->
<!--          @click="handlePrintEwaybill"-->
<!--        >电子面单打印</el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-d-arrow-right"
          size="mini"
          :disabled="multiple"
          @click="handleShipSend"
        >发货</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="ID" align="center" prop="id" />-->
      <el-table-column label="订单号" align="left" prop="orderNum" width="200px">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
          >{{scope.row.orderNum}} </el-button><br/>
          <el-tag type="info">{{ shopList.find(x=>x.id === scope.row.shopId) ? shopList.find(x=>x.id === scope.row.shopId).name : '' }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="商品明细" align="left" >
        <template slot-scope="scope" >
          <table>
            <tr v-for="item in scope.row.itemList">
            <td>
              <image-preview :src="item.goodsImg" :width="40" :height="40"/>
            </td>
            <td style="width: 300px">
              <span style="font-size: 12px"> {{item.goodsTitle}} </span>
              <span style="font-size: 14px">{{item.goodsSpec}} </span>
              <span style="font-size: 12px;color: #1c84c6">{{item.skuNum}}</span>
              <span style="font-size: 20px;color: #1f2d3d"> x{{item.quantity}}</span>
            </td>
            </tr>
          </table>

        </template>
      </el-table-column>
<!--      <el-table-column label="商品明细" align="center" width="900px" >-->
<!--        <template slot="header">-->
<!--          <table>-->
<!--            <th>-->
<!--              <td width="50px">图片</td>-->
<!--              <td width="250px" align="left">商品标题</td>-->
<!--              <td width="150" align="left">规格</td>-->
<!--              <td width="200" align="left">Sku编码</td>-->
<!--              <td width="150" align="left">电商平台SKUID</td>-->
<!--              <td width="50" align="left">数量</td>-->
<!--            </th>-->
<!--          </table>-->
<!--        </template>-->
<!--        <template slot-scope="scope" >-->
<!--          <el-table :data="scope.row.itemVoList" :show-header="false" :cell-style="{border:0 + 'px' }"  :row-style="{border:0 + 'px' }" >-->
<!--            <el-table-column label="商品图片" width="50px">-->
<!--              <template slot-scope="scope">-->
<!--                &lt;!&ndash;                <el-image  style="width: 40px; height: 40px;" :src="scope.row.goodsImg" :preview-src-list="[scope.row.goodsImg]"></el-image>&ndash;&gt;-->
<!--                <image-preview :src="scope.row.goodsImg" :width="40" :height="40"/>-->
<!--              </template>-->
<!--            </el-table-column>-->
<!--            <el-table-column label="商品名" align="left" width="250px" prop="goodsTitle" >-->
<!--              <template slot-scope="scope">-->
<!--                {{scope.row.goodsTitle}}-->
<!--                &lt;!&ndash;                <el-tag size="small" v-if="scope.row.refundStatus === 1">无售后或售后关闭</el-tag>&ndash;&gt;-->
<!--                <el-tag size="small" v-if="scope.row.refundStatus === 2">售后处理中</el-tag>-->
<!--                <el-tag size="small" v-if="scope.row.refundStatus === 3">退款中</el-tag>-->
<!--                <el-tag size="small" v-if="scope.row.refundStatus === 4">退款成功</el-tag>-->
<!--              </template>-->
<!--            </el-table-column>-->
<!--            <el-table-column label="SKU名" align="left" prop="goodsSpec" width="150"  :show-overflow-tooltip="true"/>-->
<!--            <el-table-column label="Sku编码" align="left" prop="skuNum" width="200"/>-->
<!--            <el-table-column label="平台SkuId" align="left" prop="skuId" width="150"/>-->
<!--            <el-table-column label="商品数量" align="center" prop="quantity" width="50px">-->
<!--              <template slot-scope="scope">-->
<!--                <el-tag size="small" type="danger">{{scope.row.quantity}}</el-tag>-->
<!--              </template>-->
<!--            </el-table-column>-->
<!--          </el-table>-->
<!--        </template>-->
<!--      </el-table-column><el-table-column label="商品明细" align="center" width="900px" >-->
<!--        <template slot="header">-->
<!--          <table>-->
<!--            <th>-->
<!--              <td width="50px">图片</td>-->
<!--              <td width="250px" align="left">商品标题</td>-->
<!--              <td width="150" align="left">规格</td>-->
<!--              <td width="200" align="left">Sku编码</td>-->
<!--              <td width="150" align="left">电商平台SKUID</td>-->
<!--              <td width="50" align="left">数量</td>-->
<!--            </th>-->
<!--          </table>-->
<!--        </template>-->
<!--        <template slot-scope="scope" >-->
<!--          <el-table :data="scope.row.itemVoList" :show-header="false" :cell-style="{border:0 + 'px' }"  :row-style="{border:0 + 'px' }" >-->
<!--            <el-table-column label="商品图片" width="50px">-->
<!--              <template slot-scope="scope">-->
<!--                &lt;!&ndash;                <el-image  style="width: 40px; height: 40px;" :src="scope.row.goodsImg" :preview-src-list="[scope.row.goodsImg]"></el-image>&ndash;&gt;-->
<!--                <image-preview :src="scope.row.goodsImg" :width="40" :height="40"/>-->
<!--              </template>-->
<!--            </el-table-column>-->
<!--            <el-table-column label="商品名" align="left" width="250px" prop="goodsTitle" >-->
<!--              <template slot-scope="scope">-->
<!--                {{scope.row.goodsTitle}}-->
<!--                &lt;!&ndash;                <el-tag size="small" v-if="scope.row.refundStatus === 1">无售后或售后关闭</el-tag>&ndash;&gt;-->
<!--                <el-tag size="small" v-if="scope.row.refundStatus === 2">售后处理中</el-tag>-->
<!--                <el-tag size="small" v-if="scope.row.refundStatus === 3">退款中</el-tag>-->
<!--                <el-tag size="small" v-if="scope.row.refundStatus === 4">退款成功</el-tag>-->
<!--              </template>-->
<!--            </el-table-column>-->
<!--            <el-table-column label="SKU名" align="left" prop="goodsSpec" width="150"  :show-overflow-tooltip="true"/>-->
<!--            <el-table-column label="Sku编码" align="left" prop="skuNum" width="200"/>-->
<!--            <el-table-column label="平台SkuId" align="left" prop="skuId" width="150"/>-->
<!--            <el-table-column label="商品数量" align="center" prop="quantity" width="50px">-->
<!--              <template slot-scope="scope">-->
<!--                <el-tag size="small" type="danger">{{scope.row.quantity}}</el-tag>-->
<!--              </template>-->
<!--            </el-table-column>-->
<!--          </el-table>-->
<!--        </template>-->
<!--      </el-table-column>-->

      <el-table-column label="收件人" prop="receiverName" width="200px">
        <template slot-scope="scope">
          {{scope.row.receiverName}}&nbsp;
          {{scope.row.receiverMobile}} <br />
<!--          {{scope.row.province}} {{scope.row.city}} {{scope.row.town}}-->
          {{scope.row.address}}<br />

        </template>
      </el-table-column>

      <el-table-column label="快递信息" align="center" prop="waybillCode" >
        <template slot-scope="scope">
          <span>{{scope.row.waybillCompany}}</span><br/>
          <span>{{scope.row.waybillCode}}</span>
        </template>
      </el-table-column>
      <el-table-column label="订单备注" align="center" prop="waybillStatus" >
        <template slot-scope="scope">
          <span>{{scope.row.remark}}</span>
          <span>{{scope.row.sellerMemo}}</span>
          <span>{{scope.row.buyerMemo}}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
            <el-button
                size="mini"
                v-if="scope.row.waybillCode"
                plain
                type="text"
                icon="el-icon-delete"
                @click="handleCancelWaybill(scope.row)"
            >回收单号</el-button>
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
    <!-- 取号 -->
    <el-dialog title="打印快递单" :visible.sync="getCodeOpen" width="900px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
<!--        <el-form-item label="电子面单账户" prop="accountId">-->
<!--            <el-select v-model="form.accountId" placeholder="请选择电子面单账户" clearable>-->
<!--              <el-option-->
<!--                v-for="item in deliverList"-->
<!--                :key="item.id"-->
<!--                :label="item.branchName"-->
<!--                :value="item.id">-->
<!--                <span style="float: left">{{ item.wpCode }}</span>-->
<!--                <span style="float: right; color: #8492a6; font-size: 13px" >{{item.branchName}}:{{item.quantity}}</span>-->
<!--              </el-option>-->
<!--            </el-select>-->
<!--          <el-button type="text" plain @click="updateWaybillAccount" >更新电子面单账户信息</el-button>-->
<!--        </el-form-item>-->
        <el-form-item  label="打印机" prop="printer" >
          <el-select v-model="form.printer" placeholder="请选择打印机" clearable>
            <el-option
                v-for="item in printerList"
                :key="item.name"
                :label="item.name"
                :value="item.name">
            </el-option>
          </el-select>
        </el-form-item>
        <el-table v-loading="loading" :data="shipWaybillList">
          <el-table-column type="index" width="55" label="序号" align="center" />
          <el-table-column label="订单号" align="center" prop="orderId" ></el-table-column>
          <el-table-column label="物流公司" align="center" prop="logisticsCode" ></el-table-column>
          <el-table-column label="物流单号" align="center" prop="waybillCode" ></el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" size="small" @click="handlePrintEwaybill(false)">开始打印</el-button>
        <el-button type="primary" size="small" @click="handlePrintEwaybill(true)">打印并发货</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import '@riophae/vue-treeselect/dist/vue-treeselect.css'

import {listShop} from "@/api/shop/shop";
import {waitDistOrderList, getOrder } from "@/api/order/order";
import {
  getWaybillAccountList,
  pullWaybillAccount,
  getWaybillCode,pushShipSend
} from "@/api/pdd/ewaybill";
import {cancelWaybillCode} from "@/api/shop/pdd/ewaybill";


export default {
  name: "printPdd",
  data() {
    return {
      // 遮罩层
      loading: true,
      pageLoading: false,
      // 选中数组
      ids: [],
      shopList: [],
      shipWaybillList: [],
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
      // 取号弹出
      getCodeOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        refundStatus: 1,
        platformId:300,
        orderStatus: '1',
        shopId: null
      },
      // 打印参数
      printParams: {
        deliver: null,
        printer: null
      },
      // 表单参数
      form: {
        printer:'KM-202M(NEW)',
        accountId:null
      },
      orderList: [],
      printerList: [],
      deliverList: [],
      // 表单校验
      rules: {
        accountId: [{ required: true, message: '请选择电子面单账户' }],
        printer: [{ required: true, message: '请选择打印机' }],
      }
    };
  },
  created() {
    this.openWs()
    listShop({type: this.queryParams.platformId}).then(response => {
      this.shopList = response.rows;
      if (this.shopList && this.shopList.length > 0) {
        this.queryParams.shopId = this.shopList[0].id
      }
      getWaybillAccountList({shopId: this.queryParams.shopId}).then(response => {
        this.deliverList = response.data;
        if(this.deliverList&&this.deliverList.length>0){
          this.form.accountId = this.deliverList[0].id
        }
        this.getList();
      });

    });
  },
  methods: {
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      waitDistOrderList(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.getCodeOpen = false;
      // this.reset();
      this.getList()
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderNum)
      this.single = selection.length !== 1
      this.multiple = !selection.length
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
    // 更新电子面单信息
    updateWaybillAccount() {
      pullWaybillAccount({shopId: this.queryParams.shopId}).then(response => {
        this.deliverList = response.data;
      });
    },
    /** 取号提交按钮 */
    getCodeOpenForm() {
      const ids = this.ids;
      console.log("========取号参数：",this.ids)
      if (ids) {
        if (!this.form.accountId) {
          this.$modal.msgError("请选择电子面单账户")
        } else {
          this.pageLoading = true

          console.log('===请求参数=====', {shopId: this.queryParams.shopId, ids: ids, accountId: this.form.accountId})
          getWaybillCode({
            shopId: this.queryParams.shopId,
            ids: ids,
            accountId: this.form.accountId
          }).then(response => {
            if(response.data.list.length>0) {
              this.$modal.msgSuccess("取号成功")
              this.getCodeOpen = true
              this.pageLoading = false
              this.shipWaybillList = response.data.list
            }else{
              this.$modal.msgError("没有可取号的订单！")
              this.pageLoading = false
              this.getList()
            }
            // this.getList()
            // this.getCodeOpen = false
          });

        }
      }
      else {
        this.$modal.msgError("请选择订单")
      }
    },
    handlePrintEwaybill(isSend) {
      // if (!this.ws) {
      //   this.$modal.msgError('打印组件连接失败！请安装并启动微信视频号小单打印组件！');
      //   this.openWs()
      // }
      // if(!this.printParams.deliver){
      //   this.$modal.msgError('请选择快递公司！');
      //   return
      // }
      if (!this.form.printer) {
        this.$modal.msgError('请选择打印机！');
        return
      }
      if(!this.shipWaybillList || this.shipWaybillList.length==0){
        this.$modal.msgError('没有要打印的数据！');
        return
      }

      const ws = new WebSocket('ws://127.0.0.1:5000');
      ws.onopen = () => {
        this.shipWaybillList.forEach(x =>{
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
          if(isSend){
            console.log('=====打印成功=====请求发货====',this.ids)
            return pushShipSend({shopId: this.queryParams.shopId, ids: this.ids})
          }
        }
      };


      // 当发生错误时触发
      ws.onerror = function (error) {
        obj.msgError("打印失败！");
        console.error('WebSocket error:', error);
        // alert('WebSocket error occurred. Check the console for more details.');
      };
      // const ids = this.ids;
      // getWaybillPrintData({shopId: this.queryParams.shopId, ids: ids}).then(response => {
      //   console.log("======打印======", response.data)
      //   if (response.data) {
      //
      //   }
      // });

    },
    handleCancelWaybill(row){
      console.log("=====取消取号==",row)
      cancelWaybillCode({id:row.id}).then(response => {
        this.$modal.msgSuccess("成功")
      });
    },
    handleShipSend(){
      pushShipSend({shopId: this.queryParams.shopId, ids: this.ids}).then(response => {
        this.$modal.msgSuccess("发货成功！");
        this.getList()
      })
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
    }
  }
};
</script>
