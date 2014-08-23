import org.junit.Test;
import redis.clients.jedis.Jedis;

/**
 * Created by JT on 2014/8/23.
 */
public class StartTest {

    @Test
    public void test01() {
        Jedis jedis = new Jedis("192.168.79.100");
        jedis.set("foo", "bar");
        String value = jedis.get("foo");
        System.out.println("receive:" + value);
    }
}
