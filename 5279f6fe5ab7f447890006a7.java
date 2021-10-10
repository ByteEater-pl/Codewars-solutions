import java.util.*;
class PickPeaks {    
  static Map<String,List<Integer>> getPeaks(int[] arr) {
    Map<String,List<Integer>> M =
      Map.of("pos", new ArrayList(), "peaks", new ArrayList());
    int i = 0;
    try {
      for (;;) {
        while (arr[i] >= arr[++i]);
        while (arr[i - 1] < arr[i]) {
          var j = i;
          while (arr[j] == arr[++i]);
          if (arr[j] > arr[i]) {
            M.get("pos").add(j);
            M.get("peaks").add(arr[j]);
            break;
          }
        }
      }
    } finally { return M; }
  }
}
