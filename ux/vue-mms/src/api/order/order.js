import request from '@/utils/request'

// 查询店铺订单列表
export function listOrder(query) {
  return request({
    url: '/scm-mms-api/order/list',
    method: 'get',
    params: query
  })
}

// 查询店铺订单详细
export function getOrder(id) {
  return request({
    url: '/order/' + id,
    method: 'get'
  })
}

// 新增店铺订单
export function addOrder(data) {
  return request({
    url: '/order',
    method: 'post',
    data: data
  })
}



