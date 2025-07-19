package cn.qihangerp.model.sys.domain;


import cn.qihangerp.domain.BaseEntity;

/**
 * 字典类型表 sys_dict_type
 * 
 * @author qihang
 */
public class SysDictType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 字典主键 */

    private Long dictId;

    /** 字典名称 */

    private String dictName;

    /** 字典类型 */

    private String dictType;

    /** 状态（0正常 1停用） */
    private String status;

    public Long getDictId()
    {
        return dictId;
    }

    public void setDictId(Long dictId)
    {
        this.dictId = dictId;
    }

    public String getDictName()
    {
        return dictName;
    }

    public void setDictName(String dictName)
    {
        this.dictName = dictName;
    }

    public String getDictType()
    {
        return dictType;
    }

    public void setDictType(String dictType)
    {
        this.dictType = dictType;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

}
