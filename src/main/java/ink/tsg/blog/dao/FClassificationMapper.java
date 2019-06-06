package ink.tsg.blog.dao;

import ink.tsg.blog.bean.FClassification;
import ink.tsg.blog.bean.FClassificationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FClassificationMapper {
    long countByExample(FClassificationExample example);

    int deleteByExample(FClassificationExample example);

    int deleteByPrimaryKey(Integer fclassificationId);

    int insert(FClassification record);

    int insertSelective(FClassification record);
    
    List<FClassification> selectByExample(FClassificationExample example);

    FClassification selectByPrimaryKey(Integer fclassificationId);

    int updateByExampleSelective(@Param("record") FClassification record, @Param("example") FClassificationExample example);

    int updateByExample(@Param("record") FClassification record, @Param("example") FClassificationExample example);

    int updateByPrimaryKeySelective(FClassification record);

    int updateByPrimaryKey(FClassification record);
}