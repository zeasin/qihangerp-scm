import request from '@/utils/request'

// 查询店铺列表
export function listShop(query) {
  return request({
    url: '/tenant/shop/list',
    method: 'get',
    params: query
  })
}

// 查询店铺详细
export function getShop(id) {
  return request({
    url: '/tenant/shop/' + id,
    method: 'get'
  })
}

// 新增店铺
export function addShop(data) {
  return request({
    url: '/tenant/shop',
    method: 'post',
    data: data
  })
}

// 修改店铺
export function updateShop(data) {
  return request({
    url: '/tenant/shop',
    method: 'put',
    data: data
  })
}

// 删除店铺
export function delShop(id) {
  return request({
    url: '/tenant/shop/' + id,
    method: 'delete'
  })
}

export function listPlatform(query) {
  return request({
    url: '/tenant/platform/list',
    method: 'get',
    params: query
  })
}
