<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="店铺名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入店铺名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
       <el-form-item label="平台" prop="type">
        <!-- <el-input
          v-model="queryParams.name"
          placeholder="请输入店铺名"
          clearable
          @keyup.enter.native="handleQuery"
        /> -->
        <el-select v-model="queryParams.type" placeholder="请选择平台" clearable @change="handleQuery">
         <el-option
            v-for="item in platformList"
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
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >新增</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="shopList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="店铺ID" align="center" prop="id" />
      <el-table-column label="店铺名" align="center" prop="name" />
       <el-table-column label="昵称" align="center" prop="nickName" />
      <!-- <el-table-column label="标识" align="center" prop="ename" /> -->
      <!-- <el-table-column label="店铺主体" align="center" prop="company" /> -->
      <el-table-column label="平台" align="center" prop="type" >
        <template slot-scope="scope">
          <el-tag size="small">{{ platformList.find(x=>x.id === scope.row.type)?platformList.find(x=>x.id === scope.row.type).name :'' }}</el-tag>
        </template>
      </el-table-column>

       <el-table-column label="卖家userId" align="center" prop="sellerUserIdStr" />
       <el-table-column label="AppKey" align="center" prop="appkey" />
       <el-table-column label="AppSecret" align="center" prop="appSercet" />
<!--      <el-table-column label="回调Url" align="center" prop="callbackUrl" />-->
      <el-table-column label="描述" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
          >删除</el-button>
            <el-button
              size="mini"
              plain
              type="primary"
              icon="el-icon-edit"
              @click="handleApiSetting(scope.row)"
            >API参数设置</el-button>
          <el-button
            v-if="scope.row.type==100 || scope.row.type==200 || scope.row.type==280 || scope.row.type==300"
            type="success"
            plain
            icon="el-icon-refresh"
            size="mini"
            @click="handleUpdateToken(scope.row)"
          >更新AccessToken</el-button>
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

    <!-- 添加或修改店铺对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="200px">
        <el-form-item label="店铺名" prop="name">
          <el-input v-model="form.name" placeholder="请输入店铺名" />
        </el-form-item>
        <el-form-item label="平台" prop="type">
          <el-select v-model="form.type" placeholder="请选择店铺">
           <el-option
              v-for="item in platformList"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="店铺别名" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入店铺别名" />
        </el-form-item>
        <el-form-item label="卖家UserId" prop="sellerUserId">
          <el-input v-model="form.sellerUserId" placeholder="请输入店铺卖家UserId" />
        </el-form-item>
        <el-form-item label="卖家UserId字符串" prop="sellerUserIdStr">
          <el-input v-model="form.sellerUserIdStr" placeholder="请输入店铺卖家UserId字符串" />
        </el-form-item>
        <el-form-item label="Appkey" prop="appkey">
          <el-input v-model="form.appkey" placeholder="请输入开放平台appkey" />
        </el-form-item>
        <el-form-item label="appSercet" prop="appSercet">
          <el-input v-model="form.appSercet" placeholder="请输入开放平台appSercet" />
        </el-form-item>
<!--        <el-form-item label="回调URL" prop="callbackUrl">-->
<!--          <el-input v-model="form.callbackUrl" placeholder="请输入开放平台回调URL" />-->
<!--        </el-form-item>-->
        <el-form-item label="描述" prop="remark">
          <el-input type="textarea" v-model="form.remark" placeholder="请输入描述" />
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- API参数设置对话框 -->
    <el-dialog :title="title" :visible.sync="apiOpen" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="200px">
        <el-form-item label="appKey" prop="appkey">
          <el-input v-model="form.appkey" placeholder="请输入appKey" />
        </el-form-item>
        <el-form-item label="appSecret" prop="appSercet">
          <el-input v-model="form.appSercet" placeholder="请输入appSecret" />
        </el-form-item>
<!--        <el-form-item label="API请求URL" prop="apiRequestUrl">-->
<!--          <el-input v-model="form.apiRequestUrl" placeholder="请输入API请求URL" />-->
<!--        </el-form-item>-->
        <el-form-item label="卖家UserId" prop="sellerUserId">
          <el-input v-model="form.sellerUserId" placeholder="请输入sellerUserId" />
        </el-form-item>
<!--        <el-form-item label="描述" prop="remark">-->
<!--          <el-input type="textarea" v-model="form.remark" placeholder="请输入描述" />-->
<!--        </el-form-item>-->

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <el-dialog :title="title" :visible.sync="authOpen" width="500px" append-to-body>
      <el-form ref="tokenForm" :model="tokenForm"  :rules="rules" label-width="100px">
        <el-descriptions >
          <el-descriptions-item label="授权URL："> {{ tokenForm.url }}</el-descriptions-item>
        </el-descriptions>
        <el-descriptions v-if="tokenForm.shopType === 100">
          <el-descriptions-item label="请设置淘宝开放平台回调URL"> http://ip:8088/api/store-api/tao/code_callback</el-descriptions-item>
        </el-descriptions>

        <div slot="footer" class="dialog-footer">
          请手动复制上面的URL到浏览器中访问
        </div>
        <el-form-item label="top_session" prop="code" v-if="tokenForm.shopType===100">
          <el-input type="textarea" v-model="tokenForm.code" placeholder="请复制淘宝授权后跳转页面的top_session参数值到这里" />
        </el-form-item>
        <el-form-item label="code" prop="code" v-if="tokenForm.shopType!==100">
          <el-input type="textarea" v-model="tokenForm.code" placeholder="请把授权后的code复制到这里" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="getTokenSubmit">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
      <!--      <div slot="footer" class="dialog-footer">-->
      <!--        请手动复制上面的URL到浏览器中访问-->
      <!--      </div>-->
    </el-dialog>
  </div>
</template>

<script>
import { listShop, getShop, delShop, addShop, updateShop,listPlatform } from "@/api/shop/shop";
import {getPddOAuthUrl} from "@/api/shop/pdd/shopApi";

export default {
  name: "Shop",
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
      // 店铺表格数据
      shopList: [],
      platformList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      apiOpen: false,
      authOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        type: null
      },
      // 表单参数
      form: {
        type:null
      },
      tokenForm:{
        shopId: null,
        shopType: null,
        code:null
      },
      // 表单校验
      rules: {
        name: [{ required: true, message: "店铺名不能为空", trigger: "blur" }],
        type: [{ required: true, message: "请选择平台", trigger: "change" }],
        appkey: [{ required: true, message: "不能为空", trigger: "change" }],
        appSercet: [{ required: true, message: "不能为空", trigger: "change" }],
        apiRequestUrl: [{ required: true, message: "不能为空", trigger: "change" }],
        sellerUserId: [{ required: true, message: "不能为空", trigger: "change" }],
        sellerUserIdStr: [{ required: true, message: "不能为空", trigger: "change" }],

      }
    };
  },
  created() {
    listPlatform().then(resp =>{
      this.platformList = resp.rows;
    })
    this.getList();
  },
  methods: {
    /** 查询店铺列表 */
    getList() {
      this.loading = true;
      listShop(this.queryParams).then(response => {
        this.shopList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.apiOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        nickName: null,
        ename: null,
        company: null,
        type: null,
        url: null,
        orderNum: null,
        isDelete: null,
        isShow: null,
        modifyOn: null,
        remark: null,
        sellerUserId: null,
        sellerUserIdStr: null,
        sessionKey: null,
        appkey: null,
        appSercet: null
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加店铺";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getShop(id).then(response => {
        this.form = response.data;
        this.$nextTick(()=>{
          this.form.type = response.data.type+'';
        })

        this.open = true;
        this.title = "修改店铺";
      });
    },

    handleApiSetting(row) {
      this.reset();
      const id = row.id || this.ids
      getShop(id).then(response => {
        this.form = response.data;
        this.apiOpen = true;
        this.title = "API参数设置";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateShop(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.apiOpen = false
              this.getList();
            });
          } else {
            addShop(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除店铺编号为"' + ids + '"的数据项？').then(function() {
        return delShop(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    handleUpdateToken(row){
      console.log("获取token",row)
      if(row.type == 200 || row.type == 280){
        getJdOAuthUrl({shopId:row.id}).then(response => {
          console.log("获取token=====jd ",response)
          this.authOpen = true;
          this.title = "更新店铺授权";
          this.tokenForm.url = response.data
          this.tokenForm.shopId = row.id
          this.tokenForm.shopType = row.type
        })
      }else if(row.type ==100){
        getTaoOAuthUrl({shopId:row.id}).then(response => {
          console.log("获取token=====tao ",response)
          this.authOpen = true;
          this.title = "更新店铺授权";
          this.tokenForm.url = response.data
          this.tokenForm.shopId = row.id
          this.tokenForm.shopType = row.type
        })
      }else if(row.type ==300){
        getPddOAuthUrl({shopId:row.id}).then(response => {
          console.log("获取token=====pdd ",response)
          this.authOpen = true;
          this.title = "更新店铺授权";
          this.tokenForm.url = response.data
          this.tokenForm.shopId = row.id
          this.tokenForm.shopType = row.type
        })
      }

    },
  }
};
</script>
