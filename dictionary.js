alert('bork')
function fetchword (word) {
  return fetch("https://www.cs.uky.edu/~raphael/yiddish/dictionary.cgi?base=" + word).then(function(res) {
    return res.text();
    }).then(function(html) {
      console.log(`html = ${html}`);
  });
}

fetchword("מען")