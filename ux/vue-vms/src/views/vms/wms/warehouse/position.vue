<template>
  <div class="app-container">
<!--    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">-->
<!--      <el-form-item label="货架编号" prop="number">-->
<!--        <el-input-->
<!--          v-model="queryParams.number"-->
<!--          placeholder="请输入货架编号"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="货架名称" prop="name">-->
<!--        <el-input-->
<!--          v-model="queryParams.name"-->
<!--          placeholder="请输入货架名称"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->

<!--      <el-form-item label="0正常  1删除" prop="isDelete">-->
<!--        <el-input-->
<!--          v-model="queryParams.isDelete"-->
<!--          placeholder="请输入0正常  1删除"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item>-->
<!--        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>-->
<!--        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>-->
<!--      </el-form-item>-->
<!--    </el-form>-->

<!--    <el-row :gutter="10" class="mb8">-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['wms:location:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['wms:location:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['wms:location:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['wms:location:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
<!--      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>-->
<!--    </el-row>-->

    <el-table v-loading="loading" :data="locationList" row-key="id" :tree-props="{children: 'children'}" default-expand-all @selection-change="handleSelectionChange">

      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="仓位编号" align="center" prop="number" />
      <el-table-column label="仓位名称" align="center" prop="name" />
<!--      <el-table-column label="上级id" align="center" prop="parentId" />-->
<!--      <el-table-column label="层级深度1级2级3级" align="center" prop="depth" />-->
<!--      <el-table-column label="一级类目id" align="center" prop="parentId1" />-->
<!--      <el-table-column label="二级类目id" align="center" prop="parentId2" />-->
<!--      <el-table-column label="地址" align="center" prop="address" />-->
      <el-table-column label="备注" align="center" prop="remark" />

      <el-table-column label="状态" align="center" prop="isDelete" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.isDelete === 0">正常</el-tag>
          <el-tag size="small" v-if="scope.row.isDelete === 1">删除</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            type="text"
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd(scope.row)"

          >新增</el-button>
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
            v-if="scope.row.parentId>0"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

<!--    <pagination-->
<!--      v-show="total>0"-->
<!--      :total="total"-->
<!--      :page.sync="queryParams.pageNum"-->
<!--      :limit.sync="queryParams.pageSize"-->
<!--      @pagination="getList"-->
<!--    />-->

    <!-- 添加或修改仓库货架对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="仓位编号" prop="number">
          <el-input v-model="form.number" placeholder="请输入仓位编号" />
        </el-form-item>
        <el-form-item label="仓位名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入仓位名称" />
        </el-form-item>
<!--        <el-form-item label="上级id" prop="parentId">-->
<!--          <el-input v-model="form.parentId" placeholder="请输入上级id" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="层级深度1级2级3级" prop="depth">-->
<!--          <el-input v-model="form.depth" placeholder="请输入层级深度1级2级3级" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="一级类目id" prop="parentId1">-->
<!--          <el-input v-model="form.parentId1" placeholder="请输入一级类目id" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="二级类目id" prop="parentId2">-->
<!--          <el-input v-model="form.parentId2" placeholder="请输入二级类目id" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="地址" prop="address">-->
<!--          <el-input v-model="form.address" placeholder="请输入地址" />-->
<!--        </el-form-item>-->
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="是否删除" prop="isDelete">
<!--          <el-input v-model="form.isDelete" placeholder="请输入0正常  1删除" />-->
          <el-select v-model="form.isDelete" placeholder="状态" clearable >
            <el-option label="删除" value="1"></el-option>
            <el-option label="正常" value="0"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listPosition, getLocation, delLocation, addLocation, updateLocation } from "@/api/vms/wms/position";

export default {
  name: "warehousePosition",
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
      // 仓库货架表格数据
      locationList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        warehouseId:null,
      },
      // 表单参数
      form: {
        warehouseId:null,
        isDelete: '0',
      },
      // 表单校验
      rules: {
        number: [
          { required: true, message: "货架编号不能为空", trigger: "blur" }
        ],
        name: [
          { required: true, message: "货架名称不能为空", trigger: "blur" }
        ],
        parentId: [
          { required: true, message: "上级id不能为空", trigger: "blur" }
        ],
        parentId1: [
          { required: true, message: "一级类目id不能为空", trigger: "blur" }
        ],
        parentId2: [
          { required: true, message: "二级类目id不能为空", trigger: "blur" }
        ],
        isDelete: [
          { required: true, message: "0正常  1删除不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {

  },
  mounted() {
    if (this.$route.query.warehouseId) {
      this.queryParams.warehouseId = this.$route.query.warehouseId

    }else{
      this.queryParams.warehouseId = 1;
    }
    this.getList();
  },
  methods: {
    buildTree(list, parentId) {
      let tree = [];
      for (let i = 0; i < list.length; i++) {
        if (list[i].parentId === parentId) {
          let node = {
            id: list[i].id,
            name: list[i].name,
            number:list[i].number,
            sort:list[i].sort,
            remark:list[i].remark,
            parentId:list[i].parentId,
            isDelete:list[i].isDelete,
            children: this.buildTree(list, list[i].id)
          };
          tree.push(node);
        }
      }
      return tree;
    },
    /** 查询仓库货架列表 */
    getList() {
      this.loading = true;
      listPosition(this.queryParams).then(response => {
        // this.locationList = response.rows;
        this.locationList = this.buildTree(response.rows,0 )
        console.log("构建后的list",this.locationList)
        // this.total = response.total;
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
      this.form = {
        id: null,
        number: null,
        name: null,
        parentId: null,
        warehouseId:null,
        remark: null,
        isDelete: '0',

      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
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
    handleAdd(row) {
      this.reset();
      this.form.warehouseId = this.queryParams.warehouseId
      this.form.parentId = row.id
      this.open = true;
      this.title = "添加仓库仓位";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getLocation(id).then(response => {
        this.form = response.data;
        this.form.isDelete = response.data.isDelete+''
        this.open = true;
        this.title = "修改仓库仓位";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateLocation(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addLocation(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除仓库货架编号为"' + ids + '"的数据项？').then(function() {
        return delLocation(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('wms/location/export', {
        ...this.queryParams
      }, `location_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
