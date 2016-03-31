package cz.timony.agiRocks.csv

/**
 * Covnerts the String value to the object of the given field
 * Created by tmika on 3/31/16.
 */
interface FieldConverter {

    /**
     * Converts the @value to the needed field. e.g. if the Enum is represented by the string
     * @param value
     * @return
     */
    Object convert(String value)
}