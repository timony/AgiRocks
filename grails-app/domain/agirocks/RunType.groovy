package agirocks

/**
 * Created by tmika on 5/5/16.
 */
enum RunType {
    Jumping('Jumping'), Agility('Agility'), Exam('Exam')

    String id

    RunType(String id) {
        this.id = id
    }

    @Override
    String toString() {
        id
    }

    String getKey() {
        name()
    }
}