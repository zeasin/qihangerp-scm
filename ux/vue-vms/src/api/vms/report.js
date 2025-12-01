import request from '@/utils/request'

// 首页今日销售统计
export function todayDaily(query) {
  return request({
    url: '/vms-api/report/statistics',
    method: 'get',
    params: query
  })
}




