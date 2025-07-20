import request from '@/utils/request'

// 查询退换货列表
export function listIntercept(query) {
  return request({
    url: '/scm-oms-api/afterSale/intercept_list',
    method: 'get',
    params: query
  })
}
