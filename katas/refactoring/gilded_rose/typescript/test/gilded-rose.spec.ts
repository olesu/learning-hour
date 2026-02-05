import { GildedRose, Item } from '../src/gilded-rose';

describe('Gilded Rose', () => {
  it('foo', () => {
    const items = [new Item('foo', 0, 0)];
    const gildedRose = new GildedRose(items);
    gildedRose.updateQuality();
    expect(items[0].name).toBe('fixme');
  });
});
