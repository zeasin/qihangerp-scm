<template>
  <div class="app-container">
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

        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
        <el-form-item>
          <el-select v-model="printParams.printer" placeholder="请选择打印机" clearable>
            <el-option
              v-for="item in printerList"
              :key="item.name"
              :label="item.name"
              :value="item.name">
            </el-option>
          </el-select>

        </el-form-item>
      </el-form>

    </el-row>


    <el-row :gutter="10" class="mb8">

      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-time"
          size="mini"
          :disabled="multiple"
          @click="handleGetEwaybillCode"
        >电子面单取号</el-button>
      </el-col>

      <el-col :span="1.5">

        <el-button
          type="success"
          plain
          :disabled="multiple"
          icon="el-icon-printer"
          size="mini"
          @click="handlePrintEwaybill"
        >电子面单打印</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-d-arrow-right"
          size="mini"
          :disabled="multiple"
          @click="handleShipSend"
        >电子面单发货</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="ID" align="center" prop="id" />-->
      <el-table-column label="订单号" align="left" prop="orderNum" width="180">
        <template slot-scope="scope">
          <p>{{scope.row.orderNum}}</p>

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
              <!--              <td width="150" align="left">平台SkuId</td>-->
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
            <el-table-column label="商品名" align="left" width="250px" prop="goodsName" />
            <el-table-column label="SKU名" align="left" prop="skuName" width="150"  :show-overflow-tooltip="true"/>
            <el-table-column label="Sku编码" align="left" prop="skuCode" width="200"/>
            <!--            <el-table-column label="平台SkuId" align="left" prop="skuId" width="150"/>-->
            <el-table-column label="商品数量" align="center" prop="quantity" width="50px">
              <template slot-scope="scope">
                <el-tag size="small" type="danger">{{scope.row.quantity}}</el-tag>
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>
      <el-table-column label="下单时间" align="center" prop="orderCreateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="buyerMessage" >
        <template slot-scope="scope">
          <span v-if="scope.row.buyerMessage">买家留言:{{ scope.row.buyerMessage }}</span>
          <span v-if="scope.row.sellerMemo">卖家备注:{{ scope.row.sellerMemo }}</span>
        </template>
      </el-table-column>
      <el-table-column label="收件人" prop="receiverName" width="200px">
        <template slot-scope="scope">
          {{scope.row.receiverName}}&nbsp;
          {{scope.row.receiverMobile}} <br />
          {{scope.row.province}} {{scope.row.city}} {{scope.row.town}} <br />

        </template>
      </el-table-column>
      <el-table-column label="面单号" align="center" prop="waybillCode" />
      <el-table-column label="取单状态" align="center" prop="waybillStatus" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.waybillStatus==0">未取号</el-tag>
          <el-tag size="small" v-if="scope.row.waybillStatus==1">已取号</el-tag>
          <el-tag size="small" v-if="scope.row.waybillStatus==2">已打印</el-tag>
          <el-tag size="small" v-if="scope.row.waybillStatus==3">已发货</el-tag>
          <el-tag size="small" v-if="scope.row.waybillStatus==10">手动发货</el-tag>
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
    <el-dialog title="取号" :visible.sync="getCodeOpen" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="电子面单账户" prop="accountId">
            <el-select v-model="form.accountId" placeholder="请选择电子面单账户" clearable>
              <el-option
                v-for="item in deliverList"
                :key="item.id"
                :label="item.cpCode"
                :value="item.id">
                <span style="float: left">{{ item.cpCode }}</span>
                <span style="float: right; color: #8492a6; font-size: 13px" >{{item.branchName}}:{{item.quantity}}</span>
              </el-option>
            </el-select>
          <el-button type="success" plain @click="updateWaybillAccount" >更新电子面单账户信息</el-button>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="getCodeOpenForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import {listOrder, getOrder } from "@/api/vms/order";

import {
  getWaybillAccountList,
  pullWaybillAccount,
  getWaybillCode,
  getWaybillPrintData,
  pushWaybillPrintSuccess,pushShipSend
} from "@/api/vms/ewaybill/pdd";


export default {
  name: "printPdd",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      shopList: [],
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
        platformId:300,
        refundStatus: 1,
        orderStatus: '1'
      },
      // 打印参数
      printParams: {
        deliver: null,
        printer: null
      },
      // 表单参数
      form: {},
      orderList: [],
      printerList: [],
      deliverList: [],
      // 表单校验
      rules: {
        accountId: [{ required: true, message: '请选择电子面单账户' }],
      }
    };
  },
  created() {
    this.openWs()
      this.getList();
  },
  methods: {
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderSn)
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
    // 取号弹窗
    handleGetEwaybillCode() {
      const ids = this.ids;
      if (ids) {
        getWaybillAccountList({shopId: this.queryParams.shopId}).then(response => {
          this.deliverList = response.data;
          this.getCodeOpen = true
        });
      } else {
        this.$modal.msgError("请选择订单")
      }
    },
    // 更新电子面单信息
    updateWaybillAccount() {
      pullWaybillAccount({shopId: this.queryParams.shopId}).then(response => {
        this.deliverList = response.data;
      });
    },
    /** 取号提交按钮 */
    getCodeOpenForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          const ids = this.ids;
          console.log('=========3333========', ids)
          if (ids) {
            console.log('===请求参数=====', {shopId: this.queryParams.shopId, ids: ids, accountId: this.form.accountId})
            getWaybillCode({
              shopId: this.queryParams.shopId,
              ids: ids,
              accountId: this.form.accountId
            }).then(response => {
              this.$modal.msgSuccess("取号成功")
              this.getList()
              this.getCodeOpen = false
            });
          } else {
            this.$modal.msgError("请选择订单")
          }
        }
      });
    },
    handlePrintEwaybill() {
      // if (!this.ws) {
      //   this.$modal.msgError('打印组件连接失败！请安装并启动微信视频号小单打印组件！');
      //   this.openWs()
      // }
      // if(!this.printParams.deliver){
      //   this.$modal.msgError('请选择快递公司！');
      //   return
      // }
      if (!this.printParams.printer) {
        this.$modal.msgError('请选择打印机！');
        return
      }
      const ids = this.ids;
      getWaybillPrintData({shopId: this.queryParams.shopId, ids: ids}).then(response => {
        console.log("======打印======", response.data)
        if (response.data) {
          const ws = new WebSocket('ws://127.0.0.1:5000');
          ws.onopen = () => {
            let printData = []
            response.data.forEach(x => printData.push(JSON.parse(x.printData)))
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
                  "contents": printData
                }]
              }
            }))
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
        }
      });


    },
    handleShipSend(){
      // this.$modal.msgError("开源版本未实现平台发货！请自行对接发货");
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
