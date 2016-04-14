package cz.timony.agiRocks.csv

/**
 * Created by tmika on 3/31/16.
 */
class ConverterFactory {

    public static FieldConverter getConverter(String fieldName) {
        switch (fieldName) {
            case 'workingBookNumber':
                new WorkingBookNumberConverter()
                break
            case 'size':
                new SizeConverter()
                break
            case 'category':
                new CategoryConverter()
                break
            case 'paid':
                new DoubleConverter()
                break
            default:
                new DefaultConverter()
                break
        }
    }
}
