import { add } from "./main.ts";

function assertEquals<T>(actual: T, expected: T): void {
  if (actual !== expected) {
    throw new Error(`Expected ${expected}, got ${actual}`);
  }
}

Deno.test(function addTest() {
  assertEquals(add(2, 3), 5);
});
