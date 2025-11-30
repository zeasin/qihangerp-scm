import request from '@/utils/request'

// 查询退换货列表
export function listIntercept(query) {
  return request({
    url: '/erp-api/afterSale/intercept_list',
    method: 'get',
    params: query
  })
}
