import java.math.BigInteger;

// Using java here because of the need to test very big prime numbers
// and BigInteger.isProbablePrime does that.
class Main{
	public static void main(String... args){
		BigInteger a = new BigInteger("1");
		BigInteger b = new BigInteger("1");
		int s=0;
		for(int i=0; i<250; i++){
			BigInteger t = a.add(b);
			if(a.isProbablePrime(7))
				s++;
			a = b;
			b = t;
		}
		System.out.println(s);
	}
}
