// axios
import axios from 'axios'
import Vue from "vue";

const baseURL = 'http://localhost:8082/'

const axiosIns = axios.create({
  baseURL
  // You can add your headers here
})

Vue.prototype.$http = axiosIns

export default axiosIns
