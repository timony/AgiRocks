package cz.timony.agiRocks.csv

import agirocks.Size

/**
 * Created by tmika on 3/31/16.
 */
class SizeConverter implements FieldConverter {

    @Override
    Object convert(String value) {
        Size.valueOf(value)
    }
}
