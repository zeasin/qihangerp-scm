import request from '@/utils/request'

// 查询店铺商品列表
export function listGoods(query) {
  return request({
    url: '/tenant/shop_goods/list',
    method: 'get',
    params: query
  })
}


// 新增店铺商品
export function addGoods(data) {
  return request({
    url: '/tenant/shop_goods',
    method: 'post',
    data: data
  })
}



// 删除店铺商品
export function delGoods(id) {
  return request({
    url: '/tenant/shop_goods/' + id,
    method: 'delete'
  })
}

// 查询商品规格列表
export function searchSku(query) {
  return request({
    url: '/tenant/shop_goods/searchSku',
    method: 'get',
    params: query
  })
}
