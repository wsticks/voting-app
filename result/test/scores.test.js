const assert = require('assert');
const { collectVotesFromResult } = require('../votes');

const totals = collectVotesFromResult({
  rows: [
    { vote: 'a', count: '2' },
    { vote: 'b', count: '1' },
  ],
});

assert.strictEqual(totals.a, 2);
assert.strictEqual(totals.b, 1);
assert.strictEqual(totals.a + totals.b, 3);

const empty = collectVotesFromResult({ rows: [] });
assert.deepStrictEqual(empty, { a: 0, b: 0 });

console.log('result scores test passed');
