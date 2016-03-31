package cz.timony.agiRocks.csv

/**
 * Created by tmika on 3/31/16.
 */
class WorkingBookNumberConverter implements FieldConverter {

    @Override
    Object convert(String value) {
        '0'.equals(value) ? null : value
    }
}
