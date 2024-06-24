import request from '@/utils/request'

// 查询店铺列表
export function listDistributor(query) {
  return request({
    url: '/tenant/list',
    method: 'get',
    params: query
  })
}

// 查询店铺详细
export function getDistributor(id) {
  return request({
    url: '/tenant/' + id,
    method: 'get'
  })
}

// 新增店铺
export function addDistributor(data) {
  return request({
    url: '/tenant',
    method: 'post',
    data: data
  })
}

// 修改店铺
export function updateDistributor(data) {
  return request({
    url: '/tenant',
    method: 'put',
    data: data
  })
}

