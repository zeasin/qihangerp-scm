<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="待发货订单" name="OrderList" >
        <order-list></order-list>
      </el-tab-pane>
    </el-tabs>
   </div>
</template>

<script>
import OrderList from "@/views/vms/shipping/manual_ship/order_list.vue";

export default {
  name: "manual_ship",
  components:{OrderList},
  data() {
    return {
      activeName: 'OrderList',
      typeList: [],
    };
  },
  created() {

  },
  mounted() {
    // listPlatform({status:0}).then(res => {
    //   this.typeList = res.rows;
    //   this.activeName = this.typeList[0].code
    // })
  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    }
  }
};
</script>
