import datasets
import re

overpass_nl = datasets.load_dataset("text", data_files="tmp/raphael-sch/OverpassNL/dataset/dataset.train.nl")
overpass_ql = datasets.load_dataset("text", data_files="tmp/raphael-sch/OverpassNL/dataset/dataset.train.query")

text_to_overpassql_list = []

for i in range(len(overpass_nl['train'])):
    text = overpass_nl['train'][i]['text']
    # current viewという文字列が含まれている場合はスキップ
    if "current view" in text:
        continue
    overpassql = overpass_ql['train'][i]['text']
    # [out:json]という文字列で始まっていない倍はスキップ
    if not overpassql.startswith("[out:json]"):
        continue
    # 正規表現で[timeout:125]や[timeout:250]のような文字列を[timeout:30000]に置換する
    overpassql = re.sub(r"\[timeout:\d+\]", "[timeout:30000]", overpassql)

    text_to_overpassql = {
        "text": text,
        "overpassql": overpassql
    }
    text_to_overpassql_list.append(text_to_overpassql)

print(len(text_to_overpassql_list))
print(text_to_overpassql_list[:10])
