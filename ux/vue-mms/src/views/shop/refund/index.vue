<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="微信小店" name="weiRefund" lazy>
        <refund-wei></refund-wei>
      </el-tab-pane>
      <el-tab-pane label="其他" name="qt" lazy>
        <refund-qt></refund-qt>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
import RefundWei  from "@/views/shop/refund/wei.vue";
import RefundQt from "@/views/shop/refund/qt.vue";


export default {
  name: "refund",
  components:{RefundWei, RefundQt},
  data() {
    return {
      activeName: 'weiRefund'
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
