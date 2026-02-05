import { GildedRose, Item } from './gilded-rose';

export function main(daysArg?: number): void {
  console.log('OMGHAI!');

  const items = [
    new Item('+5 Dexterity Vest', 10, 20),
    new Item('Aged Brie', 2, 0),
    new Item('Elixir of the Mongoose', 5, 7),
    new Item('Sulfuras, Hand of Ragnaros', 0, 80),
    new Item('Sulfuras, Hand of Ragnaros', -1, 80),
    new Item('Backstage passes to a TAFKAL80ETC concert', 15, 20),
    new Item('Backstage passes to a TAFKAL80ETC concert', 10, 49),
    new Item('Backstage passes to a TAFKAL80ETC concert', 5, 49),
    new Item('Conjured Mana Cake', 3, 6),
  ];

  let days = 2;
  if (daysArg !== undefined) {
    days = daysArg + 1;
  } else if (process.argv.length > 2) {
    days = parseInt(process.argv[2], 10) + 1;
  }

  const gildedRose = new GildedRose(items);

  for (let day = 0; day < days; day++) {
    console.log(`-------- day ${day} --------`);
    console.log('name, sellIn, quality');
    for (const item of items) {
      console.log(item.toString());
    }
    console.log('');
    gildedRose.updateQuality();
  }
}

if (require.main === module) {
  main();
}
