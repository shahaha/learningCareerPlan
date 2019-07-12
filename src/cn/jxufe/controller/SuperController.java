package cn.jxufe.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.PropertiesEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
 
/**
 * Created by nazi on 2018/7/24.
 */
@Controller
public class SuperController {
	private static Logger logger = LoggerFactory.getLogger(SuperController.class);
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
    	logger.info("日期转换开始");
        binder.registerCustomEditor(Date.class, new MyDateEditor());
        /*
            从PropertyEditorSupport 实现的方法可以看出，这里的绑定是为了处理空和null的数据，
            开发者可根据实际情况绑定
        */
        logger.info("1111");
        binder.registerCustomEditor(Double.class, new DoubleEditor());
        logger.info("22222");
        binder.registerCustomEditor(Integer.class, new IntegerEditor());
        logger.info("3333");
        logger.info("转换结束");
    }
 
    private class MyDateEditor extends PropertyEditorSupport {
        @Override
        public void setAsText(String text) throws IllegalArgumentException {
            //通过两次异常的处理可以，绑定两次日期的格式
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = null;
            try {
                date = format.parse(text);
                logger.info("A1");
            } catch (ParseException e) {
                format = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    date = format.parse(text);
                    logger.info("A2");
                } catch (ParseException e1) {
                	format = new SimpleDateFormat("yyyy");
                    try {
                        date = format.parse(text);
                        logger.info("A2");
                    } catch (Exception e2) {
                    	logger.error("系统异常:"+e2);
					}
                }
            }
            setValue(date);
        }
    }
 
    public class DoubleEditor extends PropertiesEditor {
        @Override
        public void setAsText(String text) throws IllegalArgumentException {
            try {
                if (text == null || text.equals("")) {
                    text = "0";
                }
            } catch (Exception e) {
            	logger.error("系统异常:"+e);
            }
            logger.info("BB");
            setValue(Double.parseDouble(text));
        }
 
        @Override
        public String getAsText() {
            return getValue().toString();
        }
    }
 
    public class IntegerEditor extends PropertiesEditor {
        @Override
        public void setAsText(String text) throws IllegalArgumentException {
            try {
                if (text == null || text.equals("")) {
                    text = "0";
                }
            } catch (Exception e) {
            	logger.error("系统异常:"+e);
            }
            logger.info("CC");
            setValue(Integer.parseInt(text));
        }
 
        @Override
        public String getAsText() {
            return getValue().toString();
        }
    }
}
