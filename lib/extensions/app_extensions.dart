
// extension ListExt<T> on List<T> {
//   List<List<T>> chunk(int chunkSize) {
//     final List<List<T>> chunks = [];
//     final int len = length;

//     for (var i = 0; i < len; i += chunkSize) {
//       final int size = i + chunkSize;
//       chunks.add(sublist(i, size > len ? len : size));
//     }
//     return chunks;
//   }
// }
