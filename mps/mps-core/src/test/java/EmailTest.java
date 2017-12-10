import com.google.common.collect.Lists;
import com.me.mps.helper.EmailHelper;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Me on 2017/12/11.
 */
public class EmailTest {

    public static void main(String[] args) throws Exception {

//        EmailHelper.sendSingleEmail("875649210@qq.com", "测试邮件。"); //yanyanghong_work@163.com 875649210@qq.com


        List<String> toList = Lists.newArrayList();
        toList.add("875649210@qq.com");
        toList.add("yanyanghong_work@163.com");
        EmailHelper.sendMultipleMail(toList, "这是第二封测试邮件。");

        String name = "";
    }
}
