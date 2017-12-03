package com.me.mps.helper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.format.Formatter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Created by yanyanghong on 2017/5/18.
 */
public class DateFomatter implements Formatter<Date> {
    Log logger = LogFactory.getLog(DateFomatter.class);

    private DateFormat dateTimeFormat;
    private DateFormat dateFormat;

    public DateFomatter(String datetimePattern, String datePattern) {
        dateTimeFormat = new SimpleDateFormat(datetimePattern);
        dateFormat = new SimpleDateFormat(datePattern);
    }

    @Override
    public Date parse(String text, Locale locale) throws ParseException {
        try {
            dateTimeFormat.setLenient(false);
            return dateTimeFormat.parse(text);
        } catch (Exception e) {
            try {
                dateFormat.setLenient(false);
                return dateFormat.parse(text);
            } catch (Exception ex) {
                logger.debug("Parse Date Error:", ex);
            }
        }

        return null;
    }

    @Override
    public String print(Date object, Locale locale) {
        try {
            dateTimeFormat.setLenient(false);
            return dateTimeFormat.format(object);
        } catch (Exception e) {
            try {
                dateFormat.setLenient(false);
                return dateFormat.format(object);
            } catch (Exception ex) {
                logger.debug("Print Date Error:", ex);
            }
        }

        return null;
    }
}
