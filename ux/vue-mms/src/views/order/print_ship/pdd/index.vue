<template>
  <div class="app-container">

    <el-tabs v-model="activeName" @tab-click="handleClick" type="border-card">
      <el-tab-pane label="待发货订单" name="WaitShipmentPdd" >
       <wait-shipment-pdd></wait-shipment-pdd>
      </el-tab-pane>
      <el-tab-pane label="已发货订单" name="ShippedListPdd" lazy>
        <shipped-list-pdd></shipped-list-pdd>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
import WaitShipmentPdd from "@/views/order/print_ship/pdd/print_list.vue";
import ShippedListPdd from "@/views/order/print_ship/pdd/shipped_list.vue";

export default {
  name: "PrintShipPdd",
  components:{
    WaitShipmentPdd,
    ShippedListPdd
  },
  data() {
    return {
      activeName: 'WaitShipmentPdd',
      typeList: [],
    };
  },
  created() {

  },
  mounted() {

  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    }
  }
};
</script>
