package cz.timony.agiRocks.csv

import agirocks.Category

/**
 * Created by tmika on 3/31/16.
 */
class CategoryConverter implements FieldConverter{
    @Override
    Object convert(String value) {
        Category.valueOf(value)
    }
}
