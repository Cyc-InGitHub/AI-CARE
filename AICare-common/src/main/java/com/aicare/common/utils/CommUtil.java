package com.aicare.common.utils;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**** 通用工具类
 *@title : JavaClass 
 *@author:wangcj
 *@createDate:2018/9/4 11:58
 *
 **/
public class CommUtil {
    public static final String TIME_FORMAT = "yyyyMMddHHmm";

    /**
     *获取短信随机数
     * @author wangcj
     * @date 2019/05/31
     * @param  counts 验证码位数
     * @return java.lang.String
     *
     */
    public static String getRandNum(int counts) {
        Random random = new Random();
        String sRand = "";
        for (int i = 0; i < counts; i++) {
            String rand = String.valueOf(random.nextInt(10));
            sRand += rand;
        }
        return sRand;
    }

    /**
     *获取系统当前日期(精确到分)，格式：yyyymmddhhmm；
     * @author wangcj
     * @date 2019/05/31
     * @param
     * @return java.lang.String
     *
     */
    public static String getDateFormatter() {
        Date date = new Date();
        DateFormat df = new SimpleDateFormat(TIME_FORMAT);
        return df.format(date);
    }

    /**
     * 生成非延迟树对象
     * @param data 数据集合
     * @param idField  主键字段
     * @param parentIdField 父级ID字段
     * @param textField 名称字段
     * @return
     */
    public static List<Map<String, Object>> buildTreeMap(List<Map<String,Object>> data, String idField, String parentIdField, String textField,String isFinal,String level){
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        HashMap<Object,Map> fullMap = new HashMap<Object, Map>();
        for(Map<String,Object> map : data){
            HashMap<String,Object> treeMap = new HashMap<String, Object>();
            treeMap.put("id", map.get(idField));
            treeMap.put("parentId",map.get(parentIdField));
            treeMap.put("name", map.get(textField));
            treeMap.put("level",map.get(level));
            treeMap.put("isFinal",map.get(isFinal));
            fullMap.put(map.get(idField), treeMap);
        }
        for(Map<String,Object> map : data){
            Number pid = (Number) map.get(parentIdField);
            Map<String,Object> treeMap = fullMap.get(map.get(idField));
            if(pid == null || pid.intValue() == 0){
                list.add(treeMap);
            }else{
                Map<String,Object> pmap = fullMap.get(pid);
                if(pmap == null) continue;
                List<Map<String,Object>> children = (List<Map<String, Object>>) pmap.get("children");
                if(children == null) {
                    children = new ArrayList<Map<String,Object>>();
                    pmap.put("children",children);
                    pmap.put("state","closed");
                }
                children.add(treeMap);
            }
        }
        return list;

    }


    /**
     * 返回excel里信息错误信息
     * @param i
     * @param info
     * @return
     */
    public static String isExactness(Integer i,String info){
        String str = String.format("第%d行的%s的格式不正确",i,info);
        return str;
    }
    /**
     * 返回excel里信息错误信息
     * @param i
     * @param info
     * @return
     */
    public static String isExistence(Integer i,String info){
        String str = String.format("第%d行的%s信息已存在",i,info);
        return str;
    }
    /**
     * 返回excel里信息错误信息
     * @param i
     * @param info
     * @return
     */
    public static String isRepeat(String info){
        String str = String.format("文件中有重复的%s信息",info);
        return str;
    }
    /**
     * 返回excel里信息错误信息
     * @param i
     * @param info
     * @return
     */
    public static String isNull(Integer i,String info){
        String str = String.format("文件中第%d行的%s信息为空",i,info);
        return str;
    }

    public static String getUserRealIP(HttpServletRequest request) throws UnknownHostException {
        String ip = "";
        // 有的user可能使用代理，为处理用户使用代理的情况，使用x-forwarded-for
        if  (request.getHeader("x-forwarded-for") == null)  {
            ip = request.getRemoteAddr();
        }  else  {
            ip = request.getHeader("x-forwarded-for");
        }
        if  ("127.0.0.1".equals(ip))  {
            // 获取本机真正的ip地址
            ip = InetAddress.getLocalHost().getHostAddress();
        }
        return ip;
    }

    public static Date getSpecifyDate(Integer minutes) throws ParseException{
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//注意月份是MM
        Long time = System.currentTimeMillis();//获得系统当前时间的毫秒数
        System.out.println("获取当前系统时间为："+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(time));//转换成标准年月日的形式
        Date date = new Date(time);
        time +=minutes*1000*60;//在当前系统时间的基础上往后加30分钟
        System.out.println("三十分钟后的时间为："+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(time));
        return  simpleDateFormat.parse(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(time));
    }
    public static String randomSalt()
    {
        // 一个Byte占两个字节，此处生成的3字节，字符串长度为6
        SecureRandomNumberGenerator secureRandom = new SecureRandomNumberGenerator();
        String hex = secureRandom.nextBytes(3).toHex();
        return hex;
    }

}
