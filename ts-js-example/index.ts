console.info("Hello via Bun!");
for (const zxc of [1, 2, 3]) {
  console.log(zxc);
}
class Foo {
  foo: string;
  bar: number = 0;
  constructor() {
    this.foo = "zxc";
  }
}
console.log("asd");

import qwe from "./qwe.ts";
console.info(qwe);
console.log("ideoooo");

const a = new Foo();

a.foo = "qwe";
a.foo = "zxc";
const b = new Foo();
b.bar = 123;
b.foo = "sfdg";
b.bar = 654;
b.bar = 123;
