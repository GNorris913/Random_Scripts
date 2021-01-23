from collections import Counter

def count_anagrams(string):
    buckets = {}
    for i in range(len(string)):
        for j in range(1, len(string) - i + 1):
            key = frozenset(Counter(string[i:i+j]).items()) # O(N) time key extract
            buckets[key] = buckets.get(key, 0) + 1
    count = 0
    for key in buckets:
        count += buckets[key] * (buckets[key]-1) // 2
    return count
    
    
    
    T = int(input().strip())
for a0 in range(T):
    s = input().strip()
    anag = 0
    map = {}
    for i in range(len(s)):
        for j in range(len(s) - i):
            s1 = ''.join(sorted(s[j:j + i + 1]))
            map[s1] = map.get(s1, 0) + 1
    for key in map:
        anag += (map[key] - 1) * map[key] // 2
    print(anag)
    
    
    
    int check_anagram(char a[], char b[])
{
   int first[26] = {0}, second[26] = {0}, c = 0;

   while (a[c] != '\0') {
      first[a[c]-'a']++;
      c++;
   }
   c = 0;
   while (b[c] != '\0') {
      second[b[c]-'a']++;
      c++;
   }

   for (c = 0; c < 26; c++) {
      if (first[c] != second[c])
         return 0;
   }

   return 1;
}

int main() {
    int t;
    scanf("%d", &t);
    while (t--) {
        char s[100];
        char sub1[100] = {0};
        char sub2[100] = {0};
        scanf("%s", s);

        int count = 0;
        for (int len = 1; len < strlen(s); len++) {
            memset(sub1, 0, len);
            for (int i = 0; i < strlen(s) - len; i++) {
                strncpy(sub1, &s[i], len);
                memset(sub2, 0, len);
                for (int j = i + 1; j < strlen(s) - len + 1; j++) {
                    strncpy(sub2, &s[j], len);
                    if (check_anagram(sub1, sub2) == 1) {
                        count++;
                    }  
                }
            }     
        }

        printf("%d\n", count);


}

return 0;
