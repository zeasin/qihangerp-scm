<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
<!--      <el-tab-pane label="淘宝天猫" name="taoOrder">-->
<!--        <order-tao></order-tao>-->
<!--      </el-tab-pane>-->
      <el-tab-pane label="微信小店" name="weiOrder">
        <order-wei></order-wei>
      </el-tab-pane>
<!--      <el-tab-pane label="抖店" name="douOrder" lazy>-->
<!--        <order-dou></order-dou>-->
<!--      </el-tab-pane>-->
      <el-tab-pane label="拼多多" name="pddOrder" lazy>
        <order-pdd></order-pdd>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
import OrderTao  from "@/views/tao/order/index";
import OrderDou  from "@/views/dou/order/index";
import OrderPdd  from "@/views/pdd/order/index";
import OrderWei  from "@/views/wei/order/index";
export default {
  name: "Order",
  components:{OrderTao,OrderDou,OrderPdd,OrderWei},
  data() {
    return {
      activeName: 'weiOrder'
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
