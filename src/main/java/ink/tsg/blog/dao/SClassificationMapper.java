package ink.tsg.blog.dao;

import ink.tsg.blog.bean.SClassification;
import ink.tsg.blog.bean.SClassificationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SClassificationMapper {
    long countByExample(SClassificationExample example);

    int deleteByExample(SClassificationExample example);

    int deleteByPrimaryKey(Integer sclassificationId);

    int insert(SClassification record);

    int insertSelective(SClassification record);

    List<SClassification> selectByExample(SClassificationExample example);

    SClassification selectByPrimaryKey(Integer sclassificationId);

    int updateByExampleSelective(@Param("record") SClassification record, @Param("example") SClassificationExample example);

    int updateByExample(@Param("record") SClassification record, @Param("example") SClassificationExample example);

    int updateByPrimaryKeySelective(SClassification record);

    int updateByPrimaryKey(SClassification record);
}