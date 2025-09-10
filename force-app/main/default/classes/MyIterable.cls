public class MyIterable implements Iterable<String>{
    private List<String> strings;
    public MyIterable(List<String> strings){
        this.strings = strings ?? new List<String>();
    }
    public Iterator<String> iterator(){
        return strings.iterator();
    }
}