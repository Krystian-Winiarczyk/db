<template>
    <vx-card>
      <h5>Sales</h5>
      <e-charts autoresize :options="line" theme="ovilia-green" ref="line" auto-resize />
    </vx-card>
</template>

<script>
import {mapGetters} from "vuex";
import ECharts from 'vue-echarts/components/ECharts'
import 'echarts/lib/component/tooltip'
import 'echarts/lib/component/legend'
import 'echarts/lib/chart/line'
import theme from './theme.json'

ECharts.registerTheme('ovilia-green', theme)

export default {
  name: "Sales",
  components: {
    ECharts
  },
  data() {


    return {
      line: {
        // Make gradient line here
        visualMap: [{
          show: false,
          type: 'continuous',
          seriesIndex: 0,
        }],
        tooltip: {
          trigger: 'axis',
          formatter: '{b} : {c}.00$'
        },
        xAxis: {
          data: []
        },
        yAxis: {
          splitLine: {show: false},
        },
        series: {
          type: 'line',
          showSymbol: false,
          data: []
        }
      },
    }
  },
  computed: {
    ...mapGetters({
      user: 'getCurrentUser',
    }),
  },
  mounted() {
    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    const userId = this.user[0].id
    this.$store.dispatch('GET_USER_SALES', userId)
      .then(res => {
        const dateList = res.map((item) => `${item.year} ${months[item.month - 1]}`);
        const valueList = res.map((item) => item.total_price);

        this.line.xAxis.data = dateList
        this.line.series.data = valueList
      })
      .catch(err => {
        console.log(err)
      })
  }
}
</script>

<style scoped>

</style>
