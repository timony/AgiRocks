package cz.timony.agiRocks.csv

/**
 * Created by tmika on 4/6/16.
 */
class DoubleConverter implements FieldConverter {
    @Override
    Object convert(String value) {
        System.out.println(value)
        if (value == null || value.isEmpty()) {
            value = 0;
        }
        new Double(value)
    }
}
