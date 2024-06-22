import request from '@/utils/request'

// 查询店铺列表
export function listDistributor(query) {
  return request({
    url: '/channel/distributor_list',
    method: 'get',
    params: query
  })
}

// 查询店铺详细
export function getDistributor(id) {
  return request({
    url: '/channel/distributor/' + id,
    method: 'get'
  })
}

// 新增店铺
export function addDistributor(data) {
  return request({
    url: '/channel/distributor',
    method: 'post',
    data: data
  })
}

// 修改店铺
export function updateDistributor(data) {
  return request({
    url: '/channel/distributor',
    method: 'put',
    data: data
  })
}

